**AVOID** using web libraries, `dart:html`, `dart:js` and 
`dart:js_util` in Flutter packages that are not web plugins. These libraries are 
not supported outside a web context; functionality that depends on them will
fail at runtime in Flutter mobile, and their use is generally discouraged in
Flutter web.

Web library access *is* allowed in:

* plugin packages that declare `web` as a supported context

otherwise, imports of `dart:html`, `dart:js` and  `dart:js_util` are disallowed.
