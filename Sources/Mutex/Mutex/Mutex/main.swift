//
//  main.swift
//  Mutex
//
//  Created by Oleh Zayats on 2/6/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

/* Implementation: */

protocol LockProtocol: NSLocking {
    func tryLock() -> Bool
}

enum MutexError: Error {
    case initialization
    case initializationOfAttributes
}

final class Mutex: LockProtocol {
    private var mtx = pthread_mutex_t()
    
    init() throws {
        var mutexattr = pthread_mutexattr_t()
        
        if pthread_mutexattr_init(&mutexattr) != 0 {
            throw MutexError.initializationOfAttributes
        }
        
        defer {
            pthread_mutexattr_destroy(&mutexattr)
        }
        
        if pthread_mutex_init(&mtx, &mutexattr) != 0 {
            throw MutexError.initialization
        }
    }
    
    deinit {
        pthread_mutex_destroy(&mtx)
    }
    
    func lock() {
        pthread_mutex_lock(&mtx)
    }
    
    func unlock() {
        pthread_mutex_unlock(&mtx)
    }
    
    func tryLock() -> Bool {
        return pthread_mutex_trylock(&mtx) == 0
    }
}

// ***

class Package {
    private let mutexLock: LockProtocol
    private var items: [String]
    
    var itemsLeft: Int {
        return items.count
    }
    
    init(count: Int, mutex: LockProtocol) {
        self.mutexLock = mutex
        self.items = Array(repeating: "1", count: count)
    }
    
    func retrieve() -> Bool {
        var retrieved: Bool = false
        
        if mutexLock.tryLock() == true {
            retrieved = itemsLeft > 0
            items.removeLast()
        }
        
        defer {
            mutexLock.unlock()
        }
        
        return retrieved
    }
}

struct Person {
    private let name: String
    private let package: Package
    private let limit: Int = 20
    
    init(_ name: String, package: Package) {
        self.name = name
        self.package = package
    }
    
    func retrieveItems() {
        var items: Int = 0

        while package.retrieve(), items < limit {
            print("\(name) retrieved 1 item from package. \(package.itemsLeft) items left.")
            items += 1
        }
        print("\(name) has \(items) items.")
    }
}

// ***

/* Usage: */

/* 1. POSIX Mutex Lock */

func testPosixMutexLock() {
    do {
        let mutex: LockProtocol = try Mutex()
        let package = Package(count: 100, mutex: mutex)
        
        let nick = Person("Nick", package: package)
        let dave = Person("Dave", package: package)
        let oleh = Person("Oleh", package: package)
        
        oleh.retrieveItems()
        nick.retrieveItems()
        dave.retrieveItems()
        
    } catch {
        print(error)
    }
}

/* 2. NSLock */

extension NSLock: LockProtocol {
    func tryLock() -> Bool {
        return self.try()
    }
}

func testCocoaMutexLock() {
    let mutex: LockProtocol = NSLock()
    let package = Package(count: 100, mutex: mutex)
    
    let nick = Person("Nick", package: package)
    let dave = Person("Dave", package: package)
    let oleh = Person("Oleh", package: package)
    
    oleh.retrieveItems()
    nick.retrieveItems()
    dave.retrieveItems()
}


// testPosixMutexLock()
testCocoaMutexLock()

