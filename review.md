https://stackoverflow.com/questions/17632024/changing-the-rootviewcontroller-of-a-uiwindow

How to set rootViewController to mainViewController

```
AppDelegate.shared.window?.subviews.forEach({ $0.removeFromSuperview() })
AppDelegate.shared.setRootViewController(mainViewController)		 
```

In app delegate:

```
func setRootViewController(_: UIViewController) {
    self.window?.rootViewController = viewController
    self.window?.makeKeyAndVisible()
}
```



