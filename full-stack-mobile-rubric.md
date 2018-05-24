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

### Callbacks are functions that often take the form of a [closure](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-ID94),

### threads:

path for accecution for codes

### Concurrent:

accecute muti taasks at the same time at a scalable manner

### GCD

### Delegate:

Delegation is a design pattern that enables a class or structure to hand off \(or delegate\) some of its responsibilities to an instance of another type

### Closure:

_**Closures**are self-contained blocks of functionality that can be passed around and used in your code_

### strong & weak

If object A has a strong reference to B, and no other object is referencing B, B has count 1

Now, if B wants to have a reference to A, we would want to use a weak reference. Weak references don’t increment the reference count of the object. So in this particular case, if A has no other objects referencing it but B, A’s count would be 0 given B’s weak reference.

### set & array

When the order of the items in the collection is not important, NSSet offers better performance for finding items in the collection; the reason is that the NSSet uses hash values to find items \(like a dictionary\), while an array has to iterate over its entire contents to find a particular object.

### coredata

Core Data is an object graph manager which also has the ability to persist object graphs to a persistent store, on a disk

  




