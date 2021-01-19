//
//  ValueOrDecodingError.swift
//  Statham
//
//  Created by Tom on 2016-07-18.
//  Copyright © 2016 Tom Lokhorst. All rights reserved.
//

import Foundation

public enum ValueOrDecodingError<Wrapped> {
  case value(Wrapped)
  case error(DecodingError)

  public var value: Wrapped? {
    get {
      switch self {
      case .value(let value): return value
      case .error: return nil
      }
    }
    set {
      if let value = newValue {
        self = .value(value)
      }
    }
  }

  public var error: DecodingError? {
    switch self {
    case .value: return nil
    case .error(let error): return error
    }
  }
}

extension ValueOrDecodingError: Decodable where Wrapped: Decodable {

  public init(from decoder: Decoder) throws {
    do {
      let container = try decoder.singleValueContainer()
      let value = try container.decode(Wrapped.self)

      self = .value(value)
    }
    catch {
      if let error = error as? DecodingError {
        self = .error(error)
      }
      else {
        let context = DecodingError.Context(codingPath: [], debugDescription: "Unexpected non-DecodingError", underlyingError: error)
        self = .error(DecodingError.dataCorrupted(context))
      }
    }
  }
}

extension ValueOrDecodingError: Encodable where Wrapped: Encodable {

  public func encode(to encoder: Encoder) throws {
    switch self {
    case .value(let value):
      var container = encoder.singleValueContainer()
      try container.encode(value)

    case .error:
      var container = encoder.singleValueContainer()
      try container.encodeNil()
    }
  }
}

