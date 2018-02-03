//
//  Berserk.swift
//  Bridge
//
//  Created by Zayats Oleh on 2/3/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

struct Berserk: Enchantment {
    func didBegin() {
        print("Rage mode! + 100 Health + doubles the Attack.")
    }
    
    func apply() {
        print("Attacked with doubled power!")
    }
    
    func didEnd() {
        print("Rage dissapears.")
    }
}
