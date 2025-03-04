// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// SharedOptions=--enable-experiment=inline-class

import 'dart:js_interop';

@JS()
external void topLevel({JSNumber named});
//                               ^
// [web] Named parameters for JS interop functions are only allowed in object literal constructors or @anonymous factories.

@JS()
inline class Inline {
  external Inline({JSNumber named});
  //                        ^
  // [web] Named parameters for JS interop functions are only allowed in object literal constructors or @anonymous factories.
  external Inline.positionalNamed(JSNumber positional, {JSNumber named});
  //                                                             ^
  // [web] Named parameters for JS interop functions are only allowed in object literal constructors or @anonymous factories.
  external static void staticMethod({JSNumber named});
  //                                          ^
  // [web] Named parameters for JS interop functions are only allowed in object literal constructors or @anonymous factories.
  external void method({JSNumber named});
  //                             ^
  // [web] Named parameters for JS interop functions are only allowed in object literal constructors or @anonymous factories.
  @ObjectLiteral()
  external Inline.positionalLiteral(JSNumber positional);
  //                                         ^
  // [web] Object literal constructors should not contain any positional parameters.
  @ObjectLiteral()
  external Inline.optionalLiteral([JSNumber optional]);
  //                                        ^
  // [web] Object literal constructors should not contain any positional parameters.
  @ObjectLiteral()
  external Inline.positionalOptionalLiteral(JSNumber positional,
      //                                             ^
      // [web] Object literal constructors should not contain any positional parameters.
      [JSNumber optional]);
  @ObjectLiteral()
  external Inline.positionalNamedLiteral(JSNumber positional, {JSNumber named});
  //                                              ^
  // [web] Object literal constructors should not contain any positional parameters.
}

extension on Inline {
  external void extensionMethod({JSNumber named});
  //                                      ^
  // [web] Named parameters for JS interop functions are only allowed in object literal constructors or @anonymous factories.
}

void main() {}
