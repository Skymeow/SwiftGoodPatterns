### 

### How memory management works in swift

difference between value type and reference type:

value type: immutable, instance keeps a unique copy of its data, usually defined as a struct, enum, tuple

reference type: eg: class. point to the piece of memory without actually creating a piece of memory 

\(struct: immutable, class: mutable\)

#### Use a value type when:

* Comparing instance data with
  ==
  makes sense
* You want copies to have independent state
* The data will be used in code across multiple threads

#### Use a reference type \(e.g. use aclass\) when:

* Comparing instance identity with
  ===
  makes sense
* You want to create shared, mutable state



