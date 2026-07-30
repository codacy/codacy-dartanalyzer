#### Description

The analyzer produces this diagnostic when:
- the language option `strict-inference` is enabled in the analysis
  options file,
- the declaration of a method or function has no return type, and
- the return type can't be inferred.

#### Example

Given an analysis options file containing the following:

```yaml
%uri="analysis_options.yaml"
analyzer:
  language:
    strict-inference: true
```

The following code produces this diagnostic because the method `m` doesn't
have a return type:

```dart
class C {
  [!m!]() => 7;
}
```

#### Common fixes

Add a return type to the method or function:

```dart
class C {
  int m() => 7;
}
```