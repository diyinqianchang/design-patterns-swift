//
//  main.swift
//  Mutex
//
//  Created by Oleh Zayats on 2/6/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

/* Implementation: */

protocol LockProtocol: NSLocking, CustomDebugStringConvertible {
    func tryLock() -> Bool
}

final class PThreadMutex: LockProtocol {
    private var mtx = pthread_mutex_t()
    
    init() {
        var mutexattr = pthread_mutexattr_t()
        
        let attrStatus = pthread_mutexattr_init(&mutexattr)
        assert(attrStatus == 0, "Failed to init pthread mutex attr, code: \(attrStatus)")
        
        defer {
            let status = pthread_mutexattr_destroy(&mutexattr)
            assert(status == 0, "Failed to destroy mutex attr in \(self), code: \(status)")
        }
        
        let status = pthread_mutex_init(&mtx, &mutexattr)
        assert(status == 0, "Failed to init pthread mutex, code: \(status)")
    }
    
    deinit {
        let result = pthread_mutex_destroy(&mtx)
        assert(result == 0, "Failed to destroy mutex in \(self)")
    }
    
    func lock() {
        let result = pthread_mutex_lock(&mtx)
        assert(result == 0, "Failed to lock in \(self)")
    }
    
    func unlock() {
        let result = pthread_mutex_unlock(&mtx)
        assert(result == 0, "Failed to unlock in \(self)")
    }
    
    func tryLock() -> Bool {
        var returnVal = false
        let status = pthread_mutex_trylock(&mtx)
        switch status {
        case 0:
            returnVal = true
        case EBUSY:
            returnVal = false
        default:
            assertionFailure("Unexpected error on 'tryLock', code: \(status)")
            returnVal = false
        }
        return returnVal
    }
}

extension PThreadMutex {
    var debugDescription: String {
        return "\n" + String(describing: type(of: self)) + ":\n"
    }
}

extension NSLock: LockProtocol {
    func tryLock() -> Bool {
        return self.try()
    }
    
    override open var debugDescription: String {
        return "\n" + String(describing: type(of: self)) + ":\n"
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



/* Usage: */

enum MutexType {
    case cocoa, posix
}

func testMutex(_ type: MutexType) {
    var mutex: LockProtocol
    
    switch type {
        case .posix:
            mutex = PThreadMutex()
        case .cocoa:
            mutex = NSLock()
    }
    
    debugPrint(mutex)
    
    let package = Package(count: 100, mutex: mutex)
    
    let nick = Person("Nick", package: package)
    let dave = Person("Dave", package: package)
    let oleh = Person("Oleh", package: package)
    
    oleh.retrieveItems()
    nick.retrieveItems()
    dave.retrieveItems()
}

/* 1. PThread Mutex Lock */

testMutex(.posix)

/* 2. Cocoa NSLock */

testMutex(.cocoa)

