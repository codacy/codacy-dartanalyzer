#### Description

The analyzer produces this diagnostic when:
- the language option `strict-inference` is enabled in the analysis
  options file,
- the invocation of a method or function has no type arguments, and
- the values for the type arguments can't be inferred.

#### Example

Given an analysis options file containing the following:

```yaml
%uri="analysis_options.yaml"
analyzer:
  language:
    strict-inference: true
```

The following code produces this diagnostic because the invocation of `m`
has no explicit type arguments, and the arguments can't be inferred:

```dart
abstract class C {
  void m<T>();
}

void f(C c) {
  c.[!m!]();
}
```

#### Common fixes

Provide explicit type arguments for the invocation:

```dart
abstract class C {
  void m<T>();
}

void f(C c) {
  c.m<int>();
}
```