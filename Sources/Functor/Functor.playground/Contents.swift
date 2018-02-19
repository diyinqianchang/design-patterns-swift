
import Foundation

/* 1. Native Swift types */

let integers = [2, 3, 4, 5]
let multipliedResult = integers.map({ return $0 * 2 })

// Array or any type that implements a 'map' function is a Functor.

// Lets make a pure functional Functor:
// Note: Haskell is using <$> operator, but it would not compile in Swift

infix operator <^>

func <^><T, U>(_ transform: (T) -> U, _ input: [T]) -> [U] {
    return input.map(transform)
}

// Caution (!): Exercise restraint when using custom operators with exotic symbols
// they are hard to type, and therefore hard to use.

let strings = ["1", "2", "3", "5", "10"]
let toInt: (String) -> Int = { return Int($0)! }

let integersResult = toInt <^> strings

/* 2. Custom types */

// As an example lets have a look at 'Result'. 
// It's quite similar to Optional(value or nil)/Either(left value or right value)
// but returns Error for you to know why a request failed

enum Result<T> {
    case success(T)
    case failure(Error)
}

/* map implementation for Result type */
extension Result {
    func map<U>(_ transform: (T) -> U) -> Result<U> {
        switch self {
        case let .success(value):
            return Result<U>.success(transform(value))
        case let .failure(error):
            return Result<U>.failure(error)
        }
    }
}
