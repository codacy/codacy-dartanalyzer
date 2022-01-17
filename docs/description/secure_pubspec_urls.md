**DO** Use secure urls in `pubspec.yaml`.

Use `https` instead of `http` or `git:`.

**GOOD:**
```yaml
repository: https://github.com/dart-lang/example
```

**BAD:**
```yaml
repository: http://github.com/dart-lang/example
```

```yaml
git:
  url: git://github.com/dart-lang/example/example.git 
```
