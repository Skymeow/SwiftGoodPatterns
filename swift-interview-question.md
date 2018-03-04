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
            return grid[(row * columns) + columns] 
        }
        
        set {
        grid[(row * columns) + columns] = newValue
    }
}

```



