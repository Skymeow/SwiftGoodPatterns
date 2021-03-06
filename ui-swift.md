### parallel effect \(UIMotion\)

[https://medium.com/@ziadtamim/create-parallax-effect-with-uimotioneffect-3a3ae7aa1679](https://medium.com/@ziadtamim/create-parallax-effect-with-uimotioneffect-3a3ae7aa1679)

### leave some space on top of the tableview

`tableView.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)`

### Cool articles about UI

[https://medium.com/reid-chatham/animation-and-data-structures-in-ios-49cc69b8020c](https://medium.com/reid-chatham/animation-and-data-structures-in-ios-49cc69b8020c)

### SpriteKit I dabbled

### [https://www.ioscreator.com/tutorials/move-sprite-along-path-spritekit-swift](https://www.ioscreator.com/tutorials/move-sprite-along-path-spritekit-swift)

### Storyboard

### [https://www.raywenderlich.com/160519/storyboards-tutorial-ios-10-getting-started-part-2](https://www.raywenderlich.com/160519/storyboards-tutorial-ios-10-getting-started-part-2)

### Sizeclasses

[https://medium.com/@craiggrummitt/size-classes-in-interface-builder-in-xcode-8-74f20a541195](https://medium.com/@craiggrummitt/size-classes-in-interface-builder-in-xcode-8-74f20a541195)

### App Architecture

MVVM: [https://medium.com/flawless-app-stories/how-to-use-a-model-view-viewmodel-architecture-for-ios-46963c67be1b](https://medium.com/flawless-app-stories/how-to-use-a-model-view-viewmodel-architecture-for-ios-46963c67be1b)

Coordinator: [https://will.townsend.io/2016/an-ios-coordinator-pattern](https://will.townsend.io/2016/an-ios-coordinator-pattern)

mvp:  [http://iyadagha.com/using-mvp-ios-swift/](http://iyadagha.com/using-mvp-ios-swift/)

### Contentoffset

[https://fizzbuzzer.com/understanding-the-contentoffset-and-contentinset-properties-of-the-uiscrollview-class/](https://fizzbuzzer.com/understanding-the-contentoffset-and-contentinset-properties-of-the-uiscrollview-class/)

### switch UI subviews in container view

bringSubview\(toFront:\)

Moves the specified subview so that it appears on top of its siblings.

view: The subview to move to the front.

### AVfoundation replace videoitem:

openfunc replaceCurrentItem\(with item: AVPlayerItem?\)

### sticky scrolling offset collection view:

[https://stackoverflow.com/questions/13492037/targetcontentoffsetforproposedcontentoffsetwithscrollingvelocity-without-subcla](https://stackoverflow.com/questions/13492037/targetcontentoffsetforproposedcontentoffsetwithscrollingvelocity-without-subcla)

### tableview hightlight cell;

[https://stackoverflow.com/questions/45651816/animate-cell-when-pressed-using-swift-3](https://stackoverflow.com/questions/45651816/animate-cell-when-pressed-using-swift-3)

### indexpath.item & indexpath.row

using "row" in the context of tables, and "item" in the context of collections.

### bring tableview to certain cell \(sticky view\)

tableView.scrollToRow\(at: indexPath, at: .top, animated: true\)

### Real time drag and drop tableview cell

[https://www.freshconsulting.com/create-drag-and-drop-uitableview-swift/](https://www.freshconsulting.com/create-drag-and-drop-uitableview-swift/)

### coreanimation

[https://www.raywenderlich.com/162315/core-graphics-tutorial-part-1-getting-started](https://www.raywenderlich.com/162315/core-graphics-tutorial-part-1-getting-started)

### Multi cell type

[https://medium.com/@stasost/ios-how-to-build-a-table-view-with-multiple-cell-types-2df91a206429](https://medium.com/@stasost/ios-how-to-build-a-table-view-with-multiple-cell-types-2df91a206429)



### pop up modal reposition + resize

```
       navigationController.modalPresentationStyle = .popover
        navigationController.preferredContentSize = Constants.reportCommentViewPreferredContentSize
        mapViewController.present(navigationController, animated: true, completion: nil)
        guard let popoverPresentationController = navigationController.popoverPresentationController else { return }
        popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0)
        popoverPresentationController.sourceView = mapViewController.view
        popoverPresentationController.sourceRect = CGRect(origin: Constants.reportCommentViewPoint, size: CGSize(width: mapViewController.view.bounds.width, height: mapViewController.view.bounds.height * 0.3))
```

### coregraphic rendering

```
let renderer = UIGraphicsImageRenderer(size: CGSize(width: Constants.cellImageFrame.width, height: Constants.cellImageFrame.height))
            let image = renderer.image { (rendererContext) in
                UIColor.green.setFill()
                rendererContext.fill(Constants.cellImageFrame) }


```



