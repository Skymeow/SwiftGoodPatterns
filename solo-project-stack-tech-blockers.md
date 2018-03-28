python rapper for readable io

[https://gist.github.com/lightstrike/0f5606e615106c44cbb8fb524595cb12](https://gist.github.com/lightstrike/0f5606e615106c44cbb8fb524595cb12)

share extension

[https://hackernoon.com/how-to-build-an-ios-share-extension-in-swift-4a2019935b2e](https://hackernoon.com/how-to-build-an-ios-share-extension-in-swift-4a2019935b2e)

rails \(in the future switch to server\)

[https://www.codemy.net/channels/rails-api](https://www.codemy.net/channels/rails-api)

youtube key

[https://console.developers.google.com/apis/credentials?project=stacked-199303](https://console.developers.google.com/apis/credentials?project=stacked-199303)

duration:

`PT15M33S`

  
p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px Menlo; color: \#000000}  
span.s1 {font-variant-ligatures: no-common-ligatures}  


**https://i.ytimg.com/vi/Y7ojcTR78qE/default.jpg**

indicates that the video is 15 minutes and 33 seconds long.

api:

[https://developers.google.com/youtube/v3/docs/videos/list\#http-request](https://developers.google.com/youtube/v3/docs/videos/list#http-request)

UI nav bar

Straight from the[UINavigationItem class reference documentation](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UINavigationItem_Class/index.html#//apple_ref/occ/instm/UINavigationItem/setHidesBackButton:animated:)-

```
self
.
navigationItem
.
setHidesBackButton
(
true
,
 animated
:
true
)
```

  
p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px Menlo; color: \#000000; background-color: \#ffffff}  
p.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px Menlo; color: \#000000; background-color: \#ffffff; min-height: 15.0px}  
span.s1 {color: \#ba2da2}  
span.s2 {color: \#703daa}  
span.s3 {color: \#d12f1b}  
span.s4 {color: \#3e1e81}  


func formatDuration\(duration: String\) -&gt;String {

let separators = CharacterSet\(charactersIn: "PT,H,M,S"\)

let parts = duration.components\(separatedBy: separators\)

let cleaned = parts.filter {$0 != ""}

let durationStr = cleaned.joined\(separator: ","\)



return durationStr

 }

