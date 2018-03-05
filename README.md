### SwiftGoodPatterns

## **Selector:**

**Solution 1:**

```
   fileprivate struct Action {
        static let buttonTapped= #selector(ViewController.buttonTapped(_:))
    }

    button.addTarget(self, action: Action.buttonTapped, for: .touchUpInside)
```

```
To prevent different tapped function get mixed up in view controller, we create a struct with static constant,
and it's good to name the struct private so we won't get a redeclaration error in the future.
```

**Better Solution:**

```
   fileprivate extension Selector {
         static let buttonTapped= #selector(ViewController.buttonTapped(_:))
   }

   button.addTarget(self, action: .buttonTapped, for: .touchUpInside)
```

```
we make a extension of Selector class, and since action argument expects a Selector object, we can just call the instance of the Selector extension.
```

### NSFetchedResultsController:

```
var fetchedResultsController: NSFetchedResultsController<Object> = NSFetchedResultsController()
let selectedObject =
        fetchedResultsController.object(at: indexPath)
```

### Coredata editing and saving child context:

```
let childContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
      childContext.parent = coreDataStack.mainContext

      let childEntry = childContext.object(with: selectedManagedObject.objectID) as! ManagedObject
```

#### Important: need to pass both managedObject and ManagedObjectContext, so it won't be removed from ARC

### Navigation bar

choose this:

```
 self.navigationController?.navigationBar.isHidden = false
```

over this:

```
self.navigationController?.isNavigationBarHidden = false
```

### Cell update imgs different each time scrolling when connection is slow bugs:

```
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellIdentifier", for: indexPath)

    if indexPath.row % 2 == 0 {
        cell.imageView?.image = UIImage(named: "\(indexPath.row)")
        cell.textLabel?.text = nil
    } else {
        cell.imageView?.image = nil
        cell.textLabel?.text = "\(indexPath.row)"
    }

    return cell
}
```

#### why? :following the rule to always assign all properties all the time!  we assign nil, if the text or the image shouldn’t be displayed

### For use basic auth header to authenticate:

Helper folder \(BasicAuth.swift\)

convert username, password data into basic64LoginString

```
import Foundation

struct BasicAuth {
    static func generateBasicAuthHeader(username: String, password: String) -> String {
        let loginString = String(format: "%@:%@", username, password)
        let loginData: Data = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString(options: .init(rawValue: 0))
        let authHeaderString = "Basic \(base64LoginString)"

        return authHeaderString
    }
}
```

Networking file:

encode the User into json and post it to server

```
 guard let model = data as? User else {return nil}
            let result = try? encoder.encode(model)
            return result
```

In header , call the basicAuth helper function above and only pass the encrypted basic dict to server

```
guard let model = data as? User,
            let password = model.password else {return [:]}

            let basicHeader = BasicAuth.generateBasicAuthHeader(username: model.email, password: password)
            return ["Authorization": basicHeader]
```

In login VC

if click on loggedin button, set isLoggedIn key to be true, store basicAuth in keychain

perform a get request to server and if success, set initial VC to be main

```
 let basicHeader = BasicAuth.generateBasicAuthHeader(username: username, password: password)
        keychain.set(basicHeader, forKey: "basicAuth")

        defaults.set(true, forKey: "isLoggedIn")
        Networking.instance.fetch(route: Route.user, method: "GET", data: nil) { (data, code)  in
            print("hola")
            DispatchQueue.main.async {
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
```

In signUp button function

eveything above and add instantiate userdefault

```
let defaults = UserDefaults.standard
```

In App delegate

instaniate userdefault and initialVC, bool for saw onboarding and isLoggedIn

set initialVC to be main if already loggin, if not, go to login page

```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // for present pageVC modally
        let defaults = UserDefaults.standard
        let initialViewController: UIViewController
        let onboarded = defaults.bool(forKey: "saw_onboarding")
        let loggedIn = defaults.bool(forKey: "isLoggedIn")

        if loggedIn && onboarded{

            initialViewController = UIStoryboard.initialViewController(for: .main)
        } else {
            initialViewController = storyboard.instantiateViewController(withIdentifier: "pageVC") as! OnboardingPageViewController
        }

        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()

        return ture
}
```

### Debugging technics:

e let d = data\[0\] as! \[Any\]; let a = d\[0\] as! \[String: Any\]; print\(a\["id"\]\)

### Programatically set embeded container view

```
class EmbedController {

    public private(set) weak var rootViewController: UIViewController?

    public private(set) var controllers = [UIViewController]()

    init (rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }

    func append(viewController: UIViewController) {
        if let rootViewController = self.rootViewController {
            controllers.append(viewController)
            rootViewController.addChildViewController(viewController)
            rootViewController.view.addSubview(viewController.view)
        }
    }

    deinit {
        if self.rootViewController != nil {
            for controller in controllers {
                controller.view.removeFromSuperview()
                controller.removeFromParentViewController()
            }
            controllers.removeAll()
            self.rootViewController = nil
        }
    }
}
```

```
class SampleViewController: UIViewController {
    private var embedController: EmbedController?

    override func viewDidLoad() {
        super.viewDidLoad()
        embedController = EmbedController(rootViewController: self)

        let newViewController = ViewControllerWithButton()
        newViewController.view.frame = CGRect(origin: CGPoint(x: 50, y: 150), size: CGSize(width: 200, height: 80))
        newViewController.view.backgroundColor = .lightGray
        embedController?.append(viewController: newViewController)
    }
}
```

### Git add all untracked files:

see untracked files: git ls-files -o --exclude-standard

add untracked files: git add $\(git ls-files -o --exclude-standard\)

### How to identify and debug memory leak?

1. If you write any code in that closure that refers to`self.`it is a potential memory leak.

Solution:

#### 1. use `[unowned self] or [weak self]in closure`

The difference between`unowned`and`weak`is that`weak`is declared as an Optional while`unowned`is not. By declaring it`weak,`you get to handle the case that it might be nil inside the closure at some point. If you try to access an`unowned`variable that happens to be nil, it will crash the whole program.

##### So only use`unowned`when you are positive that **variable will always be around while the closure is around**

#### 2. use graph debugger

The Xcode memory graph debugger helps to find and fix to retain cycles and leaked memory.

![](/assets/debug memory leak.png)

![](/assets/graph debug enable.png)

![](/assets/debug panels.png)

### [applicationWillEnterForeground\(\_:\)](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/1623076-applicationwillenterforeground)

### \(put networking in here, so it would load new views everytime you revisit the view\)

### multi threading:

**concurrency**: all events happens asyncally, allow multiple tasks to run at the same time. Tasks are guaranteed to start in the order they were added.

eg: DispatchQueue.global\(\).async,



**Multithreading** allows the processor to create concurrent \_threads, \_it can switch between, so multiple tasks can be executed at the same time.



**custom serial queue:** event happens one after each other. A good choice when you **want to perform background work serially and track it**. This eliminates resource contention since you know only one task at a time is executing. Note that if you need the data from a method, you must inline another closure to retrieve it or consider using sync.

**How to create custom serial queue?**

Dispatch synchronously onto the

1. `concurrentPhotoQueue`
   to perform the read.
2. Store a copy of the photo array in
   `photosCopy`
   and return it.

```
fileprivate let concurrentPhotoQueue =
  DispatchQueue(
    label: "com.raywenderlich.GooglyPuff.photoQueue", 
    attributes: .concurrent) 
    
```

```
var photos: [Photo] {
  var photosCopy: [Photo]!
  concurrentPhotoQueue.sync { // 1
    photosCopy = self._photos // 2
  }
  return photosCopy
}
```

! **Compare this with function using async:**

You dispatch the write operation asynchronously with a barrier. When it executes, it will be the only item in your queue

Then add the object to the array.

```
func addPhoto(_ photo: Photo) {
  concurrentPhotoQueue.async(flags: .barrier) { // 1
    self._photos.append(photo) // 2
    DispatchQueue.main.async { // 3
      self.postContentAddedNotification()
    }
  }
}
```

**Grand Central Dispatch **is a wrapper around creating threads and managing that code, making sure that a number of tasks of variable importance and length are executed in a timeframe as reasonable as possible.

eg: move the work to a background global queue and run the work in the closure asynchronously in the below code

```
DispatchQueue.global(qos: .userInitiated).async {  
    // Download file or perform expensive task

    DispatchQueue.main.async {  
        // Update the UI  
    }
}
```



**delaying a task**

```
let delay = DispatchTime.now() + .seconds(60)  
DispatchQueue.main.asyncAfter(deadline: delay) {  
    // Dodge this!  
}
```



