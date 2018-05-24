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

### OOP

#### polymorphism:

Polymorphism is the ability of a class instance to be substituted by a class instance of one of its subclasses\(similar to overriding\)

#### Encapsulation:

Encapsulation is an object-oriented design principle and hides the internal states and functionality of objects. That means the objects keep their state information private.

#### Inheritance

#### Overriding versus Overloading

#### Types versus instances

#### Composition

#### _Access Control_

### AssosiatedType:

### Any & Anyobject

ANY can represent an instance of any type at all, including function types and optional types.

AnyObject can represent an instance of any class type.

### Closures - value or reference types?

> Closures are reference types. If a closure is assigned to a variable and the variable is copied into another variable, a reference to the same closure and its capture list is also copied.

### Optional:

an optional is an enum with two cases; none, or nil, and some

```
enum
Optional
<
T
>
 {

case
none
case
some
( T )
    }
```

### REST, jSON

REST, or REpresentational State Transfer, is a set of rules for designing consistent, easy-to-use and maintainable web APIs.

JSON stands for JavaScript Object Notation; it provides a straightforward, human-readable and portable mechanism for transporting data between two systems. Apple supplies the JSONSerialization class to help convert your objects in memory to JSON and vice-versa.

### sync and aysnc

A synchronous function returns only after the completion of a task that it orders. An asynchronous function, on the other hand, returns immediately, ordering the task to be done but not waiting for it. Thus, an asynchronous function does not block the current thread of execution from proceeding on to the next function.

### MVVM:

The View Model invokes changes in the Model and updates itself with the updated Model, and since we have a binding between the View and the View Model, the first is updated accordingly.

### Dependency injection:

We use a storyboard or xib in our iOS app, then we created IBOutlets. IBOutlet is a property related to a view. These are injected into the view controller when it is instantiated, which is essentially a form of Dependency Injection. There are forms of dependency injection: constructor, property and method.

### Explain what Lazy stored properties are and when they are useful

> Lazy stored properties are used for a property whose initial values are not set until the first time it is used. You can declare a lazy stored stored property by writing the lazy modifier before its declaration. Lazy properties are useful when the initial value of a property is reliant on outside factors whose values are unknown.



