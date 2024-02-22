**AVOID** returning null for Future.

It is almost always wrong to return `null` for a `Future`.  Most of the time the
developer simply forgot to put an `async` keyword on the function.

