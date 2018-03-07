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

