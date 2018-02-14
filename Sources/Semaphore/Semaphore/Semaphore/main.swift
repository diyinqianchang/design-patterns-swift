//
//  main.swift
//  Semaphore
//
//  Created by Oleh Zayats on 2/7/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

// Wrapper for convevience + some syntactic sugar

struct Semaphore {
    private let semaphore: DispatchSemaphore
    
    init(_ poolSize: Int) {
        self.semaphore = DispatchSemaphore(value: poolSize)
    }
    
    @discardableResult
    func wait() -> DispatchTimeoutResult {
        return semaphore.wait(timeout: .distantFuture)
    }
    
    func `continue`() { semaphore.signal() }
}

func makeConcurrentQ(_ label: String) -> DispatchQueue {
    return DispatchQueue(label: label, qos: .background, attributes: .concurrent, autoreleaseFrequency: .never, target: nil)
}

func timeConsumingTask(on q: DispatchQueue, _ seconds: Int, _ f: @escaping () -> Void) {
    q.asyncAfter(deadline: .now() + .seconds(seconds), execute: { f() })
}

/* Usage: */

let semaphore = Semaphore(0)

let concurrentQ1 = makeConcurrentQ("com.zayats.oleh.concurrent.queue.1")
let concurrentQ2 = makeConcurrentQ("com.zayats.oleh.concurrent.queue.2")
let concurrentQ3 = makeConcurrentQ("com.zayats.oleh.concurrent.queue.3")
let concurrentQ4 = makeConcurrentQ("com.zayats.oleh.concurrent.queue.4")

concurrentQ1.async {
    print("Q1: started")
    
    semaphore.wait()
    
    timeConsumingTask(on: concurrentQ1, 1, { print("Q1: finished") })
}

concurrentQ2.async {
    print("Q2: started")
    
    timeConsumingTask(on: concurrentQ2, 3, { print("Q2: finished") })
}

concurrentQ3.async {
    print("Q3: started")
    
    timeConsumingTask(on: concurrentQ3, 5, { print("Q3: finished") })
}

concurrentQ4.async {
    print("Q4: started")
    
    timeConsumingTask(on: concurrentQ4, 7, { print("Q4: finished"); semaphore.continue() })
}

while true {}
