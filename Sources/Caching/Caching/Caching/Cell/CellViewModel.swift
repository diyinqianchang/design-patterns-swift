//
//  CellViewModel.swift
//  Caching
//
//  Created by Oleh Zayats on 1/31/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

struct CellViewModel {
    enum CommandKey {
        case configuration
    }
    let reuseIdentifier: String
    let commands: [CommandKey: CommandProtocol]
}
