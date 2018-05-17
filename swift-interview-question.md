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



