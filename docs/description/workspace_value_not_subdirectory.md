#### Description

The analyzer produces this diagnostic when a `workspace` list contains a
value that is not a subdirectory of the directory containing the `pubspec.yaml`` file.

#### Example

The following code produces this diagnostic because the value in the `workspace` list is not a
relative path of a subdirectory of the directory containing the 'pubspec.yaml' file:

```yaml
%uri="pubspec.yaml"
name: example
workspace:
    - /home/my_package
```

#### Common fixes

Change the `workspace` list so that it only contains only subdirectory paths.

```yaml
%uri="pubspec.yaml"
name: example
workspace:
    - pkg/package_1
    - pkg/package_2
```