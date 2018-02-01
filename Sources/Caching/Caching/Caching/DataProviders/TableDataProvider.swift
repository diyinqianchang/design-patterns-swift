//
//  TableData.swift
//  Caching
//
//  Created by Oleh Zayats on 1/29/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import UIKit

// Dummy data provider that supplies with large images from a web service

struct TableDataProvider {
    private enum Constant {
        static let url: String = "https://dummyimage.com/"
        static let size: String = "3000x3000"
    }
    
    let items: [TableItem]
    
    init() {
        var generated = [TableItem]()
        for index in 0..<500 {
            let hexColor = TableDataProvider.randomHEXColor()
            let urlString = "\(Constant.url)\(Constant.size)/\(hexColor)/\(hexColor)"
            let text = String(index)
            generated.append(TableItem(urlString: urlString, text: text))
        }
        self.items = generated
    }
}

private extension TableDataProvider {
    // Generate rndom HEX color for image
    static func randomHEXColor() -> String {
        let random = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let uicolor = UIColor(red: random, green: random, blue: random, alpha: 1.0)
        var r: CGFloat = 0; var g: CGFloat = 0; var b: CGFloat = 0; var a: CGFloat = 0
        uicolor.getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb: Int = (Int)(r * 255)<<16 | (Int)(g * 255)<<8 | (Int)(b * 255)<<0
        let hex = NSString(format:"#%06x", rgb).replacingOccurrences(of: "#", with: "")
        return hex
    }
}

struct TableItem {
    let urlString: String
    let text: String
}
