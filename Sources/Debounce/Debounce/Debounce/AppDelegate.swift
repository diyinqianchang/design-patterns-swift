//
//  AppDelegate.swift
//  Debounce
//
//  Created by Zayats Oleh on 2/3/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        testDebounce()
        return true
    }
    
    /* Usage: */
    
    func testDebounce() {
        let debouncer = Debouncer(2) {
            print("Debouncing over. Fire request!")
        }
        
        for index in 0..<10 {
            sleep(1)
            print(index)
            debouncer.invoke()
        }
    }
}

