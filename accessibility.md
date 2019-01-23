### Dynamic font:

#### UIFontMetrics

A utility object for obtaining custom fonts that scale to support Dynamic Type.

use:

```
extension UIFont.textStyle {
    var defaultFont: UIFont {
        let font = UIFont.preferredFont(forTextStyle: style)
        return UIFontMetrics(forTextStyle: style).scaledFont(for: font, maximumPointSize: maxSize)
    }
}
```



