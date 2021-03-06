[https://www.raywenderlich.com/160631/swift-algorithm-club-heap-and-priority-queue-data-structure](https://www.raywenderlich.com/160631/swift-algorithm-club-heap-and-priority-queue-data-structure)

### [https://docs.google.com/document/d/1Yre0sihpwnhBZqcWbzXNF9b9\_O58awQxl1rAo650slg/edit](https://docs.google.com/document/d/1Yre0sihpwnhBZqcWbzXNF9b9_O58awQxl1rAo650slg/edit)

### bitwise operation and usage

for swipe value

```
let a = 5
let b = 3
a = a ^ b
b = a ^ b
a = a ^ b
is actually:
a = a + b = 8
b = a - b = 5
a = a - b = 8 - 5 = 3
(swappe without using third variable)
```

### String:

```
Check prefix: guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
```

### Set

add elements to a set using set operations

`unionInPlace(_:)`

### Class, struct, enum using subscript for set and get value

```
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]

    init(rows: Int, columns: Int, grid: [Double]) {
        self.rows = rows
        self.columns = columns
        self.grid = Array(repeatElement(0.0, count: rows * columns))
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            return grid[(row * column) + column] 
        }

        set {
        grid[(row * column) + column] = newValue
    }
}
```

### Using inout to pass values:

**inout**

to make it an in-out parameter. In-out means in fact passing variable by reference, not by value. And it requires not only to accept value by reference, by also to pass it by reference, so pass it with **& **foo\(& myvar\)

### Using generics :

```
func swapValues<T> (_ a: inout T, _ b: inout T) {
    let swap = a
    a = b
    b = swap
}
```

by calling swapValues\(&"sky", &"xu"\) you can swap values

#### copying items into arr

`Array(repeatElement(target, count: num))`

### Higher order functions\(map, filer, reduce\)

if you want to** return values**, use them.

#### map:

**to loop over a collection and apply the same operation to each element in the collection.**

use it with a`Dictionary`or a`Set`, the **result will always be an**`Array`. Here is an example with a Dictionary:

```
let squares3 = values.map({
  (value: Double) -> Double in
  return value * value
})
or:

let squares4 = values.map {value in value * value}
or"
let squares5 = values.map { $0 * $0 }
```

#### filter:

a closure that takes as an argument the element from the collection and must return a

`Bool`

indicating if the item should be included in the result.

```
let even = digits.filter { $0 % 2 == 0 }
```

#### reduce

method takes two values, an **initial value and a combine closure**.

you can also write reduce using the trailing closure syntax:

```
let names = ["alan","brian","charlie"]
let csv = names.reduce("===") {text, name in "\(text),\(name)"}
// "===,alan,brian,charlie"
```

#### flatmap:

```
let onlyEven2 = collections.flatMap { $0.filter { $0 % 2 == 0 } }
```

#### chaining

```
let numbers = [20,17,35,4,12]
let evenSquares = numbers.filter{$0 % 2 == 0}.map{$0 * $0}
// [400, 16, 144]
```

### Article about generics

[https://krakendev.io/blog/generic-protocols-and-their-shortcomings](https://krakendev.io/blog/generic-protocols-and-their-shortcomings)

### Swift compare date

```
let date1 = Date()
let date2 = Date().addingTimeInterval(100)

if date1 == date2
{
}
else if date1 > date2
{
}
else if date1 < date2
{
}
```

### Date

```
       let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC")
//        let dateStr = formatter.string(from: date)
```

### auto layout

\_Auto Layout \_dynamically calculates the size and position of all the views in your view hierarchy. It's an Xcode feature

Set the buttons horizontal Compression Resistance Priority to 1000. And now, change the priority of the width constraint to any value between 0 to 999. ie; less than the horizontal Compression Resistance Priority of the button. Auto Layout now allows our button’s intrinsic content size to take precedent over our width constraint:

### ![](/assets/Screenshot 2018-05-14 14.21.50.png)Singleton

### use it when you want to make sure only one instance of a class is instantiated and that your application only uses that instance.

```
let
 sharedURLSession 
=
URLSession
.
shared


// Default File Manager
let
 defaultFileManager 
=
FileManager
.
default
// Standard User Defaults
let
 standardUserDefaults 
=
UserDefaults
.
standard


// Default Payment Queue
let
 defaultPaymentQueue 
=
SKPaymentQueue
.
default
(
)
```

#### why should we not use it

1. **They are global mutable shared state.**

2. **The relationships between singletons and the code that depends on them is usually not very well defined**

   Since singletons are so convenient and easy to access — using them extensively usually leads to very hard to maintain “spaghetti code” that doesn’t have clear separations between objects

3. **Managing their lifecycle can be tricky**

### .coreanimaiton

[https://academy.realm.io/posts/tryswift-tim-oliver-advanced-graphics-with-core-animation/](https://academy.realm.io/posts/tryswift-tim-oliver-advanced-graphics-with-core-animation/)

CALayers are what CAAnimations are applied to, not UIViews.

Core Graphics is entirely done on the CPU, and cannot be performed on the GPU.

eg:

You can use Core Graphics to create the actual bitmaps, and use Core Animation to display them to create some cool effects.

#### extension limitation

Can't have stored property, override function in extensions, have to use static var in extension for instantiate properties.

### NSOperatio VS GCD

The `NSOperation`API is a higher level abstraction of Grand Central Dispatch.

Even though this is a highly optimized process, it is inherently slower than Grand Central Dispatch, which operates at a lower level.

## NSOPeration

class img filter problem :[https://www.raywenderlich.com/76341/use-nsoperation-nsoperationqueue-swift](https://www.raywenderlich.com/76341/use-nsoperation-nsoperationqueue-swift)

### 1. Dependencies

The`NSOperation`API provides support for dependencies. This is a powerful concept that enables developers to execute tasks in a specific order. An operation is ready when every dependency has finished executing.

### 2. Observable

The`NSOperation`and`NSOperationQueue`classes have a number of properties that can be observed, using KVO \([Key Value Observing](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html)\). This is another important benefit if you want to monitor the state of an operation or operation queue.

### 3. Pause, Cancel, Resume\( more flexible than GCD\)

Operations can be paused, resumed, and cancelled. Once you dispatch a task using Grand Central Dispatch, you no longer have control or insight into the execution of that task. The`NSOperation`API is more flexible in that respect, giving the developer control over the operation's life cycle.

### 4. Control

The`NSOperationQueue`also adds a number of benefits to the mix. For example, you can specify the maximum number of queued operations that can run simultaneously. This makes it easy to control how many operations run at the same time or to create a serial operation queue.

## GCD

Grand Central Dispatch is ideal if you just need to dispatch a block of code to a serial or concurrent queue.

### OOP

[https://www.raywenderlich.com/160728/object-oriented-programming-swift](https://www.raywenderlich.com/160728/object-oriented-programming-swift)

### The \_factory \_pattern is a way to encapsulate the implementation details of creating objects, which adheres to a common base class or interface.

## Interview questions I've been asked:

**given an array of words, how to eliminate the duplicates. You have a simple tree structure Ⓐ and its clone ⓐ. Each node in the tree has a pointer to it's parent as well as an array of its children. Given an original tree's node Ⓑ and cloned tree ⓐ, implement a method that returns ⓑ \(the clone of Ⓑ\). \(Imagine finding the matching UIButton/UISlider/UIView in a separate cloned view controller.\) Original Ⓐ ┏━┻━━┓ ◯ ◯ ┏┻┓ ┏━╋━┓ ◯ ◯ ◯ ◯ ◯ ┏┻┓ ┃ ◯ Ⓑ ◯ Clone ⓐ ┏━┻━━┓ ◯ ◯ ┏┻┓ ┏━╋━┓ ◯ ◯ ◯ ◯ ◯ ┏┻┓ ┃ ◯ ⓑ ◯**

**Find the subview with specific tag**

[https://medium.com/journey-of-one-thousand-apps/finding-the-first-common-superview-in-swift-4abac8a87d84](https://medium.com/journey-of-one-thousand-apps/finding-the-first-common-superview-in-swift-4abac8a87d84)

### Order of functions in cell

```
awakeFromNib called
notesCell dequeued
layoutSubviews called
```

### control statement

**Continue:**

> A continue statement ends program execution of the current iteration of a loop statement but does not stop execution of the loop statement.

```
var
 sum 
=
0
;
for
var
 i 
=
0
;
 i 
<
5
;
 i
++
{
if
 i 
==
4
{
continue
//this ends this iteration of the loop

}

    sum 
+=
 i 
//thus, 0, 1, 2, and 3 will be added to this, but not 4

}
```

**Break:**

> A break statement ends program execution of a loop, an if statement, or a switch statement.

```
var
 sum 
=
0
;
for
var
 i 
=
0
;
 i 
<
5
;
 i
++
{
if
 i 
==
2
{
break
//this ends the entire if-statement

}

    sum 
+=
 i 
//thus only 0 and 1 will be added

}
```

**Fallthrough:**

> A fallthrough statement causes program execution to continue from one case in a switch statement to the next case.

```
var
 sum 
=
0
var
 i 
=
3
switch
 i 
{
case
1
:

    sum 
+=
 i

case
2
:

    sum 
+=
 i

case
3
:

    sum 
+=
 i

fallthrough
//allows for the next case to be evaluated

case
 i 
%
3
:

    sum 
+=
 i

}
```

**Throw:**

> You use a throw statement to throw an error.

You could throw an error like the one below that says that five more coins are needed due to insufficient funds.

```
throw
VendingMachineError
.
InsufficientFunds
(
coinsNeeded
:
5
)
```

**Return:**

> A return statement occurs in the body of a function or method definition and causes program execution to return to the calling function or method.

```
func
 myMethod
(){

    newMethod
()
}
func
 newMethod
(){
var
 sum 
=
0
;

    sum 
+=
2
;
if
 sum 
>
1
{
return
//jumps back to myMethod()

}

    sum 
+=
3
;
//this statement will never be executed

}
```

Returns can also be used to return a value from the function.

```
func
 myFunc
()
{
let
 value 
=
 newFunc
()
//assigns 5 to "value"

}
func
 newFunc
()
-
>
Int
{
return
5
}
```

### decoding & nestedcontainer

[https://stackoverflow.com/questions/44549310/how-to-decode-a-nested-json-struct-with-swift-decodable-protocol](https://stackoverflow.com/questions/44549310/how-to-decode-a-nested-json-struct-with-swift-decodable-protocol)

### different present VC method

> **1. Show**- Pushes the destination view controller onto the navigation stack, moving the source view controller out of the way \(destination slides overtop from right to left\), providing a back button to navigate back to the source - on all devices.
>
> Example: Navigating inboxes/folders in Mail.
>
> **2. Show Detail**- Replaces the detail/secondary view controller when in a UISplitViewController with no ability to navigate back to the previous view controller.
>
> Example: In Mail on iPad in landscape, tapping an email in the sidebar replaces the view controller on the right to show the new email.
>
> **3. Present Modally**- Presents a view controller in various different ways as defined by the Presentation option, covering up the previous view controller - most commonly used to present a view controller that animates up from the bottom and covers the entire screen on iPhone, but on iPad it's common to present it in a centered box format overtop that darkens the underlying view controller.
>
> Example: Tapping the + button in Calendar on iPhone.
>
> **4. Popover Presentation**- When run on iPad, the destination appears in a small popover, and tapping anywhere outside of this popover will dismiss it. On iPhone, popovers are supported as well but by default if it performs a Popover Presentation segue, it will present the destination view controller modally over the full screen.
>
> Example: Tapping the + button in Calendar on iPad \(or iPhone, realizing it is converted to a full screen presentation as opposed to an actual popover\).
>
> **5. Custom**- You may implement your own custom segue and have complete control over its appearance and transition.

### Coding challenges

```
//1. recursively flatten a nested array
//var list = [3, 4, [4, [[55]]]] as [Any]
//
//func flatten(arr: [Any]) -> [Any] {
//    var final = [Any]()
//    for i in arr {
//        if let num = i as? Int {
//            final.append(num)
//        } else if let numArr = i as? [Any] {
//            let flatList = flatten(arr: numArr)
//            final += flatList
//        }
//    }
//    return final
//}
//
//let e = flatten(arr: list)
```

### Swift Copy on write \( how swift prioritize value type permamamce\)

two value just sharing the same instance until one of them changes, value will be copied only upon mutation

```
var array1 = [1, 2, 3, 4]

address(of: array1)     // 0x60000006e420

var array2 = array1

address(of: array2)     // 0x60000006e420

array1.append(2)

address(of: array1)     // 0x6080000a88a0
address(of: array2)     // 0x60000006e420
```

[https://medium.com/@lucianoalmeida1/understanding-swift-copy-on-write-mechanisms-52ac31d68f2f](https://medium.com/@lucianoalmeida1/understanding-swift-copy-on-write-mechanisms-52ac31d68f2f)

### Swift handling race condition

#### read and write to same resource issue:

use customized concurrent queue with barrier for write\(append method\)

use concurrent queue sync for read

**write**

\(dispatch the write operation asynchronously with a barrier. When it executes, it will be the only item in your queue.\)

```
func addPhoto(_ photo: Photo) {
  concurrentPhotoQueue.async(flags: .barrier) { // 1
    self._photos.append(photo) // 2
  }
}
```

**read**

\(dispatch syncly on read\)

```
var photos: [Photo] {
  var photosCopy: [Photo]!
  concurrentPhotoQueue.sync { // 1
    photosCopy = self._photos // 2
  }
  return photosCopy
}
```

### Swift 4.1 new feature

[https://www.hackingwithswift.com/articles/50/whats-new-in-swift-4-1](https://www.hackingwithswift.com/articles/50/whats-new-in-swift-4-1)

### Semophore:

```
let higherPriority = DispatchQueue.global(qos: .userInitiated)
let lowerPriority = DispatchQueue.global(qos: .utility)

let semaphoreA = DispatchSemaphore(value: 1)
let semaphoreB = DispatchSemaphore(value: 1)

func asyncPrint(queue: DispatchQueue, symbol: String, firstResource: String, firstSemaphore: DispatchSemaphore, secondResource: String, secondSemaphore: DispatchSemaphore) {
  func requestResource(_ resource: String, with semaphore: DispatchSemaphore) {
    print("\(symbol) waiting resource \(resource)")
    semaphore.wait()  // requesting the resource
  }

  queue.async {
    requestResource(firstResource, with: firstSemaphore)
    for i in 0...10 {
      if i == 5 {
        requestResource(secondResource, with: secondSemaphore)
      }
      print(symbol, i)
    }

    print("\(symbol) releasing resources")
    firstSemaphore.signal() // releasing first resource
    secondSemaphore.signal() // releasing second resource
  }
}

asyncPrint(queue: higherPriority, symbol: "🔴", firstResource: "A", firstSemaphore: semaphoreA, secondResource: "B", secondSemaphore: semaphoreB)
asyncPrint(queue: lowerPriority, symbol: "🔵", firstResource: "B", firstSemaphore: semaphoreB, secondResource: "A", secondSemaphore: semaphoreA)
```

### Difference between protocol and extension

https://stackoverflow.com/questions/30859411/what-is-the-difference-between-protocol-extension-and-category-in-ios-developme



