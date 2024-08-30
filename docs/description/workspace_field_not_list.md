#### Description

The analyzer produces this diagnostic when the value of the `workspace` key
isn't a list.

#### Example

The following code produces this diagnostic because the value of the
`workspace` key is a string when a list is expected:

```yaml
%uri="pubspec.yaml"
name: example
workspace: [!notPaths!]
```

#### Common fixes

Change the value of the workspace field so that it's a list:

```yaml
%uri="pubspec.yaml"
name: example
workspace:
    - pkg/package_1
    - pkg/package_2
```