![alt text](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Art/art_title_image.png)

![](https://img.shields.io/badge/Licence-MIT-blue.svg)  ![](https://img.shields.io/badge/Swift-4.0-orange.svg)  ![](https://travis-ci.org/oleh-zayats/design-patterns-swift.svg?branch=master)


An open-source repo of design pattern implementations in Swift programming language. </br> 
All examples are located [HERE](https://github.com/oleh-zayats/design-patterns-swift/tree/master/Sources). Check out the table below for convenience.

## Table of Implementations: </br> 

👮🏼 Behavioural  | 👷🏼 Creational      | 👨🏼‍🏭 Structural    | 👨🏼‍🎓 Non-GOF | 👨🏻‍🔬 Functional |
------------ | ------------- | ------------- | ------------- |  ------------- |
[Chain of Responsibility](https://git.io/vNH7g) | [Factory Method](https://git.io/vNH7o) | [Adapter](https://git.io/vNH5C) | [Dependency Injection](https://git.io/vNH71) | [Functor](https://git.io/vNH7S) |
[Strategy](https://git.io/vNdul) |[Abstract Factory](https://git.io/vNdu0) | [Bridge](https://git.io/vAfBP) | [Object Pool](https://git.io/vNH5U) | [Applicative](https://git.io/vNh7D) 
[Command](https://git.io/vNH5I) | [Singleton](https://git.io/vNH5t) | [Flyweight](https://git.io/vNH5E) |  [Caching](https://github.com/oleh-zayats/design-patterns-swift/tree/master/Sources/Caching/Caching) | [Monad](https://git.io/vAeKb) 
[State](https://git.io/vNH5G) | [Builder](https://git.io/vNH5n) | [Decorator](https://git.io/vNH5v) | [Private Class Data](https://git.io/vNH5l) | [Future & Promise](https://git.io/vNH5D) 
[Observer](https://git.io/vNH54) | [Prototype](https://git.io/vNH5R) | [Proxy](https://git.io/vNH5Y) | [Delegate](https://git.io/vNH5u) | [Callback](https://git.io/vNhSY)
[Memento](https://git.io/vNH5z)| | [Facade](https://git.io/vNH7i) | [Multicast Delegate](https://git.io/vNH5i) | 
[Iterator](https://git.io/vNH59)| | [Composite](https://git.io/vAfB0) | [DataSource](https://git.io/vNH55)
[Template Method](https://git.io/vNbdh) |  |  | [Lazy Loading](https://git.io/vNH5F)
[Mediator](https://git.io/vNH5b) |  |  | [Throttling](https://git.io/vNH5N)
[Interpreter](https://git.io/vNbAk) |  |  | [Debouncing](https://git.io/vNxZX)
[Visitor](https://git.io/vNH5p)  |  |  | 

| 🚥 Concurrency |
------------ |
| [Promise](https://git.io/vAGml) |
| [Mutex](https://git.io/vAffL) |
| [Reader Writer Lock](https://git.io/vAsbb) |
| [Two-Phase Termination](https://git.io/vA3QB) |
| [Semaphore](https://git.io/vAsRV) |

| 🏯 Architectural |
------------ |
| Coordinator |
| MVP |
| MVVM |
| Unidirectional Data Flow |
| Clean Architecture |
| VIPER |

### Pattern Overview 
Each pattern is overviewed in a separate Markdown file which contains description, structure, UML, advantages/disadvantages etc. Click on a pattern title to see more.

👮🏼 Behavioural </br> 
> Design patterns that identify common communication patterns between objects and realize these patterns. By doing so, these patterns increase flexibility in carrying out this communication.

[Chain of Responsibility](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/ChainOfResponsibility/ChainOfResponsibility.md) </br> 
[Strategy](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Strategy/Strategy.md) </br> 
[Command](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Command/Command.md) </br> 
[State](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/State/State.md) </br> 
[Observer](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Observer/Observer.md) </br> 
[Iterator](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Iterator/Iterator.md) </br> 
[Memento](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Memento/Memento.md) </br> 
[Template Method](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/TemplateMethod/TemplateMethod.md) </br> 
[Mediator](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Mediator/Mediator.md) </br> 
[Interpreter](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Interpreter/Interpreter.md)</br> 
[Visitor](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Visitor/Visitor.md) </br> 

👷🏼 Creational </br> 
> Design patterns that deal with object creation mechanisms, trying to create objects in a manner suitable to the situation. 

[Factory Method](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/FactoryMethod/FactoryMethod.md) </br> 
[Abstract Factory](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/AbstractFactory/AbstractFactory.md) </br> 
[Singleton](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Singleton/Singleton.md) </br> 
[Builder](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Builder/Builder.md) </br> 
[Prototype](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Prototype/Prototype.md) </br> 
[Class Cluster](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Class%20Cluster/ClassCluster.md) </br> 

👨🏼‍🏭 Structural </br> 
> Design patterns that ease the design by identifying a simple way to realize relationships between entities.

[Facade](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Facade/Facade.md) </br> 
[Decorator](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Decorator/Decorator.md) </br> 
[Proxy](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Proxy/Proxy.md) </br> 
[Adapter](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Adapter/Adapter.md) </br> 
[Flyweight](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Flyweight/Flyweight.md) </br> 
[Bridge](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Bridge/Bridge.md) </br> 
[Composite](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Composite/Composite.md) </br> 

👨🏼‍🎓 Non-GOF </br> 
> Design patterns that are not described in the GOF book.

[Dependency Injection](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/DependencyInjection/DependencyInjection.md) </br> 
[Object Pool](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/ObjectPool/ObjectPool.md) </br> 
[Private Class Data](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/PrivateClassData/PrivateClassData.md) </br> 
[Delegate](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Delegate/Delegate.md) </br> 
[Multicast Delegate](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/MulticastDelegate/MulticastDelegate.md) </br> 
[DataSource](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/DataSource/DataSource.md) </br> 
[Lazy Loading](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/LazyLoading/LazyLoading.md) </br> 
[Throttling](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Throttling/Throttling.md)
[Debouncing](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Debounce/Debounce.md)

👨🏻‍🔬 Functional </br> 
> Design patterns that come from functional programming.

[Monad](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Monad/Monad.md) </br> 
[Future & Promise](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/FuturePromise/FuturePromise.md) </br> 
[Callback](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Callback/Callback.md) </br> 
[Functor](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Functor/Functor.md) </br> 
[Applicative](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Applicative/Applicative.md) </br> 

🚥 Concurrency </br> 
> Concurrent programming patterns. </br> 

[Promise](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/FuturePromise/FuturePromise.md) </br> 
[Mutex](https://github.com/oleh-zayats/design-patterns-swift/blob/master/Sources/Mutex/Mutex.md) </br> 
Semaphore </br> 
Reader Writer Lock </br> 
