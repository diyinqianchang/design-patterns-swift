//
//  main.swift
//  ReadWriteLock
//
//  Created by Oleh Zayats on 2/7/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

/* RW lock with concurrent queue */

var unsafeResource = Data()

let concurrentQ = DispatchQueue(label: "com.zayats.oleh.concurrent.queue", qos: .default, attributes: .concurrent)

var safeResource: Data {
    set {
        concurrentQ.sync(flags: .barrier) {
            unsafeResource = newValue
        }
    }
    get {
        return concurrentQ.sync {
            return unsafeResource
        }
    }
}

/* RW lock with generic type and concurrent queue */

class Atomic<T> {
    private var item: T
    private var concurrentQ = DispatchQueue(label: "com.zayats.oleh.atomic.concurrent.queue", qos: .default, attributes: .concurrent)
    
    init(_ item: T) {
        self.item = item
    }
    
    func read<Return>(_ read: (T) throws -> Return) rethrows -> Return {
        return try concurrentQ.sync {
            return try read(item)
        }
    }
    
    func write<Return>(_ write: (inout T) throws -> Return) rethrows -> Return {
        return try concurrentQ.sync(flags: .barrier) {
            return try write(&item)
        }
    }
}

let safeData = Atomic(Data())

safeData.write {
    let toWrite = "Hello."
    if let stringData = toWrite.data(using: .utf8) {
        $0.append(stringData)
    }
}

safeData.read {
    if let readString = String(data: $0, encoding: .utf8) {
        print(readString)
    }
}

while true {}
