//
//  main.swift
//  Composite
//
//  Created by Zayats Oleh on 2/3/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

protocol CompositeProtocol {
    func display()
}

/* Concrete Composite */

class Composite: CompositeProtocol {
    private var children = [Composite]()
    
    func append(_ composite: Composite) {
        children.append(composite)
    }
    
    func display() {
        displayBefore()
        children.forEach { $0.display() }
        displayAfter()
    }
    
    func displayBefore() { }
    func displayAfter() { }
}

/* Concrete classes */

final class Letter: Composite {
    private let character: Character
    
    init(_ character: Character) {
        self.character = character
        super.init()
    }
    
    override func displayBefore() {
        print(character)
    }
}

final class Word: Composite {
    init(_ letters: [Letter]) {
        super.init()
        letters.forEach { append($0) }
    }
    
    override func displayBefore() {
        print(" ")
    }
}

final class Sentence: Composite {
    init(_ words: [Word]) {
        super.init()
        words.forEach { append($0) }
    }
    
    override func displayAfter() {
        print(".")
    }
}

/* Usage: */

struct MessageBuilder {
    private init() {}
    
    static func orcMessage() -> Composite {
        return Sentence([
            Word([Letter("H"), Letter("u"), Letter("m"), Letter("a"), Letter("n"), Letter("s")]),
            Word([Letter("m"), Letter("u"), Letter("s"), Letter("t")]),
            Word([Letter("b"), Letter("e")]),
            Word([Letter("s"), Letter("l"), Letter("a"), Letter("y"), Letter("e"), Letter("d")])
        ])
    }
    
    static func humanMessage() -> Composite {
        return Sentence([
            Word([ Letter("L"), Letter("O"), Letter("L")]),
            Word([ Letter("C"), Letter("o"), Letter("o"), Letter("l")]),
            Word([ Letter("d"), Letter("o"), Letter("w"), Letter("n")])
        ])
    }
}

print("*** Orcs:")

let orcMessage: CompositeProtocol = MessageBuilder.orcMessage() // Composite.Sentence
orcMessage.display()

print("\n*** Humans:")

let humanResponse: CompositeProtocol = MessageBuilder.humanMessage() // Composite.Sentence
humanResponse.display()

