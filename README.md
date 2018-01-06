# SwiftGoodPatterns

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



