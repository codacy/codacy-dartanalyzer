**AVOID**

* assigning directly to the `href` field of an AnchorElement
* assigning directly to the `src` field of an EmbedElement, IFrameElement, or
  ScriptElement
* assigning directly to the `srcdoc` field of an IFrameElement
* calling the `createFragment` method of Element
* calling the `open` method of Window
* calling the `setInnerHtml` method of Element
* calling the `Element.html` constructor
* calling the `DocumentFragment.html` constructor


**BAD:**
```dart
var script = ScriptElement()..src = 'foo.js';
```
