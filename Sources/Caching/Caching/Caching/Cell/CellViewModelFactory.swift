//
//  CellViewModelFactory.swift
//  Caching
//
//  Created by Oleh Zayats on 1/31/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

struct CellViewModelFactory {
    func create(with item: TableItem, imageLoader: ImageProvider) -> CellViewModel {
        var commands = [CellViewModel.CommandKey: CommandProtocol]()
        
        /* Configuration */
        commands[.configuration] = CellConfigurationCommand(title: item.text, imageProvider: imageLoader, urlString: item.urlString)
        
        let viewmodel = CellViewModel(reuseIdentifier: TableViewCell.reuseIdentifier, commands: commands)
        return viewmodel
    }
}
