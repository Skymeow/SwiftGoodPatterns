### 

### How memory management works in swift:

swift use ARC: automatic reference count to manage deallocate and allocate memories.

when it's strongly typed reference, the count would be bumped up when being referenced

when two properties are both strongly typed, it creates a retain cycle: even if deinit both property, count wouldn't return 0.\( instance can't be deallocated\)

**each reference, that points to an instance of a class, is a so-called strong reference.**

**if one strong reference pointing to an instance, this instance will not be deallocated.**

### difference between value type and reference type:

value type: immutable, instance keeps a unique copy of its data, usually defined as a struct, enum, tuple

reference type: eg: class. point to the piece of memory without actually creating a piece of memory

\(struct: immutable, class: mutable\)

#### Use a value type when:

* # Comparing instance data with

  makes sense
* You want copies to have independent state
* The data will be used in code across multiple threads

#### Use a reference type \(e.g. use aclass\) when:

* # Comparing instance identity with

  makes sense
* You want to create shared, mutable state



