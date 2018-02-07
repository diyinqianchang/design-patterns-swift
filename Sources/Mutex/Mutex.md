
# Mutex (Mutual Exclusion Lock)

### Description </br>
Pattern's intent is to create a lock which only allows a single thread to access a resource at any one instant.  </br>

Strictly speaking, a mutex is locking mechanism used to synchronize access to a resource. Only one task (can be a thread or process based on OS abstraction) can acquire the mutex. It means there is ownership associated with mutex, and only the owner can release the lock (mutex). </br>

> Note: There is an ambiguity between binary semaphore and mutex. We might have come across that a mutex is binary semaphore. But they are not! The purpose of mutex and semaphore are different. May be, due to similarity in their implementation a mutex would be referred as binary semaphore. </br>

### iOS/MacOS adaptation </br>
NSLock, NSRecursiveLock, NSConditionLock, NSDistributedLock </br>

### Structure/UML*
--

### Rules of thumb*
--

### Why and where you should use the pattern

### Pros </br>

### Cons </br>

### More
https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Multithreading/ThreadSafety/ThreadSafety.html
