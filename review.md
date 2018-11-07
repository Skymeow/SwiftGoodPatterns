[https://stackoverflow.com/questions/17632024/changing-the-rootviewcontroller-of-a-uiwindow](https://stackoverflow.com/questions/17632024/changing-the-rootviewcontroller-of-a-uiwindow)

How to set rootViewController to mainViewController

```
  let previousRootViewController = self.window?.rootViewController
  self.window?.rootViewController = viewController                      
  self.window?.makeKeyAndVisible()                     
  previousRootViewController?.dismiss(animated: false, completion: nil)
```

In app delegate:

```
func setRootViewController(_: UIViewController) {
    self.window?.rootViewController = viewController
    self.window?.makeKeyAndVisible()
}
```



