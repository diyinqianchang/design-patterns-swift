

# Callback (Handler / Completion Handler)

### Description </br>
Callback is a piece of executable code that is passed as an argument to other code, which is expected to call back (execute) the argument at some convenient time.  </br>
Programming languages support callbacks in different ways, often implementing them with subroutines, lambda expressions, blocks, or function pointers. </br>

### iOS/MacOS adaptation </br>
Callback pattern is trivial and widely used in iOS SDK.  URLSession's dataTask and UIViewController's present functions to name a few. </br>

### Structure/UML*
--

### Rules of thumb*
--

### Why and where you should use the pattern*

### Pros </br>
Follows Inversion of Control principle. </br>
Simplest mechanism of communication in code. Reduses complexity. </br>

### Cons </br>
Overusage can lead to callback hell. </br>
https://www.quora.com/What-is-callback-hell

### More
--
