
import UIKit

protocol ExpressionProtocol {
    func interpret(_ ctx: Context) -> Double
}

final class Context {
    private var variables: [String: Double]

    init() {
        self.variables = [:]
    }
    
    func setValue(_ value: Double, forName name: String) {
        variables[name] = value
    }
    
    func value(for name: String) -> Double {
        return variables[name]!
    }
}

/* terminal expression */
final class Value: ExpressionProtocol {
    private let name: String
    
    init(_ name: String) { self.name = name }

    func interpret(_ ctx: Context) -> Double {
        return ctx.value(for: name)
    }
}

/* non-terminal expression */
final class Add: ExpressionProtocol {
    let lhs: ExpressionProtocol
    let rhs: ExpressionProtocol
    
    init(lhs: ExpressionProtocol, rhs: ExpressionProtocol) {
        self.lhs = lhs; self.rhs = rhs
    }
    
    func interpret(_ ctx: Context) -> Double {
        return lhs.interpret(ctx) + rhs.interpret(ctx)
    }
}

/* non-terminal expression */
final class Substract: ExpressionProtocol {
    let lhs: ExpressionProtocol
    let rhs: ExpressionProtocol
    
    init(lhs: ExpressionProtocol, rhs: ExpressionProtocol) {
        self.lhs = lhs; self.rhs = rhs
    }
    
    func interpret(_ ctx: Context) -> Double {
        return lhs.interpret(ctx) - rhs.interpret(ctx)
    }
}

/* non-terminal expression */
final class Multiply: ExpressionProtocol {
    let lhs: ExpressionProtocol
    let rhs: ExpressionProtocol
    
    init(lhs: ExpressionProtocol, rhs: ExpressionProtocol) {
        self.lhs = lhs; self.rhs = rhs
    }
    
    func interpret(_ ctx: Context) -> Double {
        return lhs.interpret(ctx) * rhs.interpret(ctx)
    }
}

/* Usage: */

let context = Context()
context.setValue(10.0, forName: "A")
context.setValue(5.0,  forName: "B")
context.setValue(2.0,  forName: "C")

// create an object to evaluate the expression A + B - C or A - B * C
let addition = Add(lhs: Value("A"), rhs: Value("B"))
let expression = Substract(lhs: addition, rhs: Value("C"))
let result = expression.interpret(context)

let substraction = Substract(lhs: Value("A"), rhs: Value("B"))
let expression2 = Multiply(lhs: substraction, rhs: Value("C"))
let result2 = expression2.interpret(context)


