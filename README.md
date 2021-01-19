<img src="https://cloud.githubusercontent.com/assets/75655/13197297/538d3f90-d7ea-11e5-8967-9c519785c2bf.png" width="125" alt="Statham">
<hr>

Statham is a library for dealing with JSON in Swift, it provides the `ValueOrDecodingError<Wrapped>` type.


Example
-------

```swift
struct Inbox: Decodable {
  let items: [ValueOrDecodingError<Item>] 
}
```

Using this structure, if one of the items can't be decoded, the others still will be decoded. 


About the previous version 1
--------

Version 2.0 of this library is a competely different thing than the 1.0 version of Statham.
The previous version was used for a custom Json decoder code generator, but as of Swift 4 with Decodable, this code generator is no longer needed.

Read more about [version 1](https://github.com/tomlokhorst/Statham/tree/version-1) of Statham.


Releases
--------

 - 2.2.0 - 2021-01-19 - Add .value setter on ValueOrDecodingError type
 - 2.1.0 - 2019-06-10 - Add Indirect type, to deal with cycles in JSON structs/enums
 - **2.0.0** - 2018-08-21 - Replaced previous library with ValueOrJsonError


Licence & Credits
-----------------

Statham is written by [Tom Lokhorst](https://twitter.com/tomlokhorst)
and available under the [MIT license](https://github.com/tomlokhorst/Statham/blob/develop/LICENSE),
so feel free to use it in commercial and non-commercial projects.
