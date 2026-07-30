#### Description

The analyzer produces this diagnostic when the `@Deprecated.optional`
annotation is applied to a parameter that isn't an optional parameter. The
annotation must not be used on a parameter in a local function, an
anonymous function, a function-typed parameter, or a typedef. It is only
valid on optional parameters in a top-level function, a method, or a
constructor.

#### Example

The following code produces this diagnostic because the annotation is on a
required parameter:

```dart
void f(@[!Deprecated.optional!]() int p) {}
```

#### Common fixes

Remove the annotation:

```dart
void f(int p) {}
```