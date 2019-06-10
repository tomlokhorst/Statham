//
//  Indirect.swift
//  Statham
//
//  Created by Tom Lokhorst on 2019-05-20.
//

import Foundation

// To break a cycle of nested value types (enums/structs),
// put an Indirect<T>? at some point in your JSON
public enum Indirect<Wrapped> {
  indirect case value(Wrapped)

  public var value: Wrapped {
    switch self {
    case .value(let value):
      return value
    }
  }

  public func map<U>(_ transform: (Wrapped) throws -> U) rethrows -> Indirect<U> {
    return .value(try transform(value))
  }
}

extension Indirect: Decodable where Wrapped: Decodable {
  public init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()

    self = .value(try container.decode(Wrapped.self))
  }
}

extension Indirect: Encodable where Wrapped: Encodable {
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()

    switch self {
    case .value(let value):
      try container.encode(value)
    }
  }
}

extension Indirect: Equatable where Wrapped: Equatable {
  public static func == (lhs: Indirect<Wrapped>, rhs: Indirect<Wrapped>) -> Bool {
    return lhs.value == rhs.value
  }
}
