Use the `throwsA` matcher instead of try-catch with `fail()`.

**BAD:**

```dart
// sync code
try {
  someSyncFunctionThatThrows();
  fail('expected Error');
} on Error catch (error) {
  expect(error.message, contains('some message'));
}

// async code
try {
  await someAsyncFunctionThatThrows();
  fail('expected Error');
} on Error catch (error) {
  expect(error.message, contains('some message'));
}
```

**GOOD:**
```dart
// sync code
expect(
  () => someSyncFunctionThatThrows(),
  throwsA(isA<Error>().having((Error error) => error.message, 'message', contains('some message'))),
);

// async code
await expectLater(
  () => someAsyncFunctionThatThrows(),
  throwsA(isA<Error>().having((Error error) => error.message, 'message', contains('some message'))),
);
```

