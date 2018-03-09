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



