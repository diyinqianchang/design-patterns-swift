//
//  WeaponProtocol.swift
//  Bridge
//
//  Created by Zayats Oleh on 2/3/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

protocol Weapon {
    func wield()
    func swing()
    func unwield()
    func prepareEnchantment() -> Enchantment
}
