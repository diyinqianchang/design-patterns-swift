//
//  Debounce.swift
//  Debounce
//
//  Created by Zayats Oleh on 2/3/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

final class Debouncer {
    typealias Function = () -> Void
    
    private weak var timer: Timer?
    private var f: Function
    private var debounceDelay: Double
    
    init(_ debounceDelay: Double, f: @escaping Function) {
        self.debounceDelay = debounceDelay
        self.f = f
    }
    
    func invoke() {
        cancel()
        timer = Timer
            .scheduledTimer(timeInterval: debounceDelay,
                            target: self,
                            selector: #selector(Debouncer.invokeFunction),
                            userInfo: nil,
                            repeats: false)
    }
    
    @objc
    private func invokeFunction() { f() }
    private func cancel() { timer?.invalidate() }
}
