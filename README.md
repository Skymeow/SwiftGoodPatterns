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
Debugging technics:

 e let d = data[0] as! [Any]; let a = d[0] as! [String: Any]; print(a["id"])
Optional(testRoom1)

