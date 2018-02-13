//
//  main.swift
//  TwoPhaseTermination
//
//  Created by Zayats Oleh on 2/13/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

import Foundation

@available(OSX 10.12, *)
final class Session {
    private var counter: Int = 0
    private var thread: Thread!
    
    init() {}
    
    func run() {
        initialize()
        thread.start()
    }
    
    func interrupt() {
        thread.cancel()
    }
    
    @available(OSX 10.12, *)
    private func initialize() {
        thread = Thread {
            while self.thread.isCancelled == false {
                self.increment()
            }
            self.shutDown()
        }
    }
    
    private func increment() {
        sleep(1)
        counter += 1
        print("Session time: \(counter)")
    }
    
    private func shutDown() {
        while counter > 0 {
            sleep(1)
            counter -= 1
            print("Shutdown in: \(counter)")
        }
    }
}

if #available(OSX 10.12, *) {
    
    let session = Session()
    
    DispatchQueue.global().async {
        session.run()
    }
    
    sleep(10)
    
    session.interrupt()
    
    sleep(10)
}
