//
//  TableViewController.swift
//  Caching
//
//  Created by Oleh Zayats on 1/29/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private var imageProvider: ImageProvider!
    private let cache = Cache()
    private let httpClient = NetworkClient()
    
    // Creating viewModels from dataSource:
    // supplying tableItem with image url and an imageProvider instance we want to use
    // factory creates viewModel with assembled commands to execute in 'tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)'
    lazy var cellViewModels: [CellViewModel] = {
        let viewModelFactory = CellViewModelFactory()
        let tableDataSource = TableDataProvider()
        return tableDataSource.items.map {
            return viewModelFactory.create(with: $0, imageLoader: imageProvider)
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageProvider = ImageProvider(with: httpClient, cache: cache)
    }
}

// MARK: - TableViewDataSource
extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = cellViewModels[indexPath.item]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseIdentifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        // Used Command pattern to encapsulate and decouple cell configuration (network downloads, caching, UI setup).
        // select/deselect/remove...etc. commands could be added later aswell
        viewModel
            .commands[CellViewModel.CommandKey.configuration]?
            .execute(on: cell)
        return cell
    }
}

// MARK: - TableViewDelegate
extension TableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
