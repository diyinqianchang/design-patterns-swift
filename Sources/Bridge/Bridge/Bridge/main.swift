//
//  main.swift
//  Bridge
//
//  Created by Zayats Oleh on 2/3/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

/* Usage: */

let berserk = Berserk()
let enchantedSword = Sword(enchantment: berserk)
enchantedSword.wield()
enchantedSword.swing()
enchantedSword.unwield()

print("\n")

let featherWeight = FeatherWeight()
let enchantedHammer = Hammer(enchantment: featherWeight)
enchantedHammer.wield()
enchantedHammer.swing()
enchantedHammer.unwield()


