
import Foundation

/* Implementation: */

struct Wrapped<T> {
    let value: T
    
    init(_ value: T) {
        self.value = value
    }
}

extension Wrapped {
    func map<U>(_ transform: (T) -> U) -> Wrapped<U> {
        return Wrapped<U>(transform(value))
    }

    func flatten<T>(_ wrapped: Wrapped<Wrapped<T>>) -> Wrapped<T> {
        return wrapped.value
    }
}

/* creating a custom operator for conveniance */

// to resolve 'adjacent operators are in non-associative precedence group ‘DefaultPrecedence’' error
// we can define precedence group, so that the compiler can evaluate the operator chain (X >>= Y >>= Z etc.)

precedencegroup UnionOperatorPrecedence {
    associativity: left
}

infix operator >>= : UnionOperatorPrecedence

func >>= <T, U>(wrapped: Wrapped<T>, transform: (T) -> Wrapped<U>) -> Wrapped<U> {
    return wrapped.flatten(wrapped.map(transform))
}

/* Usage: */

let wrapped = Wrapped(100)
let add = { Wrapped($0 + 50) }
let substract = { Wrapped($0 - 20) }
let toString = { Wrapped(String($0 + 0)) }

let wrappedResult = wrapped >>= add >>= substract >>= toString
let unwrappedValue = wrappedResult.value
