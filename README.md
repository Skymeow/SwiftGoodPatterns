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

#### why? :following the rule to always assign all properties all the time!  we assign nil, if the text or the image shouldn’t be displayed



