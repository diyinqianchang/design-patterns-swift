//
//  FeatherWeight.swift
//  Bridge
//
//  Created by Zayats Oleh on 2/3/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

struct FeatherWeight: Enchantment {
    func didBegin() {
        print("Weapon becomes lighter and starts glowing.")
    }
    
    func apply() {
        print("Item is thrown into an enemy and returns back to the owner!")
    }
    
    func didEnd() {
        print("Glow fades, original weight slowly comes back.")
    }
}
