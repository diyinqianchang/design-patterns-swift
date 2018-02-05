
import Foundation

extension Collection {
    func apply<U>(_ transformations: [(Element) -> U]) -> [U] {
        var result = [U]()
        transformations.forEach {
            for element in map($0) {
                result.append(element)
            }
        }
        return result
    }
}

infix operator <*>

func <*><T, U>(_ transformations: [(T) -> U], collection: [T]) -> [U] {
    return collection.apply(transformations)
}

typealias StringTransformation = (String) -> String

let transformations: [StringTransformation] = [ { $0.replacingOccurrences(of: "%", with: "") },
                                                { $0.replacingOccurrences(of: "$", with: "") } ]

let result = transformations <*> ["%hello%", "Dollar$", "$%$%$%$%!"]

