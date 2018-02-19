
struct Instruction {
    let task: String
    func execute() { print(task) }
}

struct Container<T> {
    private let items: [T]
    
    init(with items: [T]) {
        self.items = items
    }
}

/* IteratorProtocol directly gives you access to the same elements in the same order
 * as iterating over that sequence using a for-in loop.
 */

struct ContainerIterator<T>: IteratorProtocol {
    private let sequence: [T]
    private var index = 0
    
    init(_ sequence: [T]) {
        self.sequence = sequence
    }
    
    mutating func next() -> T? {
        defer { index += 1 }
        let next = sequence.count > index ? sequence[index] : nil
        return next
    }
}

extension Container: Sequence {
    func makeIterator() -> ContainerIterator<T> {
        return ContainerIterator(self.items)
    }
}

/* Usage: */

let instructions = [Instruction(task: "Analizing territory"),
                    Instruction(task: "Analizing motion"),
                    Instruction(task: "Destroying detected humans"),
                    Instruction(task: "Launching laughing protocol: \"Mua-ha-ha!\"")]

let machineInstructions = Container<Instruction>(with: instructions)

for instrution in machineInstructions {
    instrution.execute()
}
