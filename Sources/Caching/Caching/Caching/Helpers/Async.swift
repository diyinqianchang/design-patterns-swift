//
//  Async.swift
//  Caching
//
//  Created by Zayats Oleh on 1/28/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

// just some syntactic sugar

enum ThreadType { case main, background }

func async(_ thread: ThreadType, _ f: @escaping () -> Void) {
    switch thread {
        case .main:
            DispatchQueue.main.async { f() }
        case .background:
            DispatchQueue.global(qos: .background).async { f() }
    }
}
