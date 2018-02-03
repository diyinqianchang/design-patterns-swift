//
//  Sword.swift
//  Bridge
//
//  Created by Zayats Oleh on 2/3/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

struct Sword: Weapon {
    private let enchantment: Enchantment
    
    init(enchantment: Enchantment) {
        self.enchantment = enchantment
    }
    
    func wield() {
        print("The sword is wielded.")
        enchantment.didBegin()
    }
    
    func swing() {
        print("The sword is swinged.")
        enchantment.apply()
    }
    
    func unwield() {
        print("The sword is unwielded.")
        enchantment.didEnd()
    }
    
    func prepareEnchantment() -> Enchantment {
        return enchantment
    }
}
