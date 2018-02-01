//
//  CellConfigCommand.swift
//  Caching
//
//  Created by Oleh Zayats on 1/31/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

var associatedURLStringKey: String = "imageURLString"

class CellConfigurationCommand: Command<TableViewCell> {
    
    private let imageProvider: ImageProvider
    private var task: URLSessionTask?
    private let urlString: String
    
    init(title: String, imageProvider: ImageProvider, urlString: String) {
        self.imageProvider = imageProvider
        self.urlString = urlString
        
        super.init { cell in
            cell.numberLabel.text = title
        }
    }
    
    override func execute(on receiver: AnyObject) {
        super.execute(on: receiver)
        
        guard let cell = receiver as? TableViewCell else {
            return
        }
        
        // Associating urlString value with cell to keep downloading and image setup in sync
        objc_setAssociatedObject(cell, &associatedURLStringKey, urlString, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        task = imageProvider.load(from: urlString, { (result, url) in
            
            switch result {
            case .success(let image):
                
                // checking the associated urlString (syncing)
                if let previousURLString = objc_getAssociatedObject(cell, &associatedURLStringKey) as? String {
                    if previousURLString == self.urlString {
                        
                        async(.main, { cell.dummyImageView.image = image })
                    }
                }
            case .failure(let error):
                // proper error handling should be provided in real production code...
                print(error)
            }
        })
    }
}
