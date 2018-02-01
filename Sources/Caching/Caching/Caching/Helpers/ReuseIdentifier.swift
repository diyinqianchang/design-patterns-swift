//
//  ReuseIdentifier.swift
//  Caching
//
//  Created by Oleh Zayats on 1/29/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import UIKit

protocol ReuseIdentifier {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifier where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: type(of: self)).components(separatedBy: ".").first ?? ""
    }
}
