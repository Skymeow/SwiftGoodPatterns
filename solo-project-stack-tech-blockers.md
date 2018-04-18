editing drag and drop:

```
 func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        <#code#>
    }
```

### green tint color:

UIColor\(red:0.25, green:0.58, blue:0.58, alpha:1.0\)

### Grey

UIColor\(red:0.73, green:0.73, blue:0.73, alpha:1.0\)

### assets: [https://drive.google.com/drive/folders/1Dvx9GLptyFfiLAOdz6ZgAY9A2DLwVPxD?usp=sharing](https://drive.google.com/drive/folders/1Dvx9GLptyFfiLAOdz6ZgAY9A2DLwVPxD?usp=sharing)

third party api[https://docs.google.com/document/d/1-4Jb8vkNKgREcrK3D\_8D88cYIW5m466d0qu0kx1KJTY/edit?ts=5ab5248a](https://docs.google.com/document/d/1-4Jb8vkNKgREcrK3D_8D88cYIW5m466d0qu0kx1KJTY/edit?ts=5ab5248a)

python rapper for readable io

[https://gist.github.com/lightstrike/0f5606e615106c44cbb8fb524595cb12](https://gist.github.com/lightstrike/0f5606e615106c44cbb8fb524595cb12)

share extension

[https://hackernoon.com/how-to-build-an-ios-share-extension-in-swift-4a2019935b2e](https://hackernoon.com/how-to-build-an-ios-share-extension-in-swift-4a2019935b2e)

[https://medium.com/@ales.musto/making-a-share-extension-that-accepts-text-and-urls-in-combination-with-coredata-swift-3-a0139c0f9800](https://medium.com/@ales.musto/making-a-share-extension-that-accepts-text-and-urls-in-combination-with-coredata-swift-3-a0139c0f9800)

rails \(in the future switch to server\)

[https://www.codemy.net/channels/rails-api](https://www.codemy.net/channels/rails-api)

youtube key

[https://console.developers.google.com/apis/credentials?project=stacked-199303](https://console.developers.google.com/apis/credentials?project=stacked-199303)

duration:

`PT15M33S`

p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px Menlo; color: \#000000}  
span.s1 {font-variant-ligatures: no-common-ligatures}

[https://i.ytimg.com/vi/Y7ojcTR78qE/default.jpg](https://i.ytimg.com/vi/Y7ojcTR78qE/default.jpg)

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

p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 13.0px Menlo; color: \#000000}  
span.s1 {font-variant-ligatures: no-common-ligatures}

[https://itunes.apple.com/us/podcast/sleep-and-relax-asmr/id1133320064?mt=2&i=10003989096](https://itunes.apple.com/us/podcast/sleep-and-relax-asmr/id1133320064?mt=2&i=10003989096)

[https://www.appcoda.com/building-rss-reader-using-uisplitviewcontroller-uipopoverviewcontroller/](https://www.appcoda.com/building-rss-reader-using-uisplitviewcontroller-uipopoverviewcontroller/)

[http://sleepandrelaxasmr.libsyn.com/rss](http://sleepandrelaxasmr.libsyn.com/rss)

imges for safari

[https://stackoverflow.com/questions/33205158/access-webpage-properties-in-share-extension](https://stackoverflow.com/questions/33205158/access-webpage-properties-in-share-extension)

[https://chariotsolutions.com/blog/post/implementing-drag-drop-ios-11/](https://chariotsolutions.com/blog/post/implementing-drag-drop-ios-11/)





```
func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let cells = tableView.visibleCells as! [VideoFeedCell]
        if tableView.indexPathsForVisibleRows?.count != 0 {
            let indexPath = tableView.indexPathsForVisibleRows!.last!
            let lastVisibleIndex = indexPath.row
            print(lastVisibleIndex)
            if lastVisibleIndex > 1 {
        //  1.      scrolling up
            if self.lastContentOffset! > scrollView.contentOffset.y {
                //                disable the last visible cell
                let prevIndex = tableView.indexPathsForVisibleRows?[lastVisibleIndex-2]
                if let old =  self.tableView.cellForRow(at: prevIndex!) as? VideoFeedCell {
                    old.playerLayer?.player?.pause()
                }
                //                play the second last visible cell
                self.currentPlayingCell = cells[lastVisibleIndex-1]
                self.prepareVideoLoading(cell: self.currentPlayingCell!, forItemAtIndex: (lastVisibleIndex-1))
            } else if self.lastContentOffset! < scrollView.contentOffset.y {
                //                disable the second last visible cell
                let prevIndex = tableView.indexPathsForVisibleRows?[lastVisibleIndex-1]
                if let old =  self.tableView.cellForRow(at: prevIndex!) as? VideoFeedCell {
                    old.playerLayer?.player?.pause()
                }
                //                play the last visible cell
                self.currentPlayingCell = cells[lastVisibleIndex-2]
                self.prepareVideoLoading(cell: self.currentPlayingCell!, forItemAtIndex: (lastVisibleIndex-1))
            }
            }
        }
    }
    
```



