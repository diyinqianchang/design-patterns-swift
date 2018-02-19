//
//  ViewController.swift
//  Future
//
//  Created by Zayats Oleh on 1/27/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    private let httpClient: HTTPClientProtocol = HTTPClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/f/fd/Meteor_Crater_-_Arizona.jpg")!
        
        httpClient.load(from: url).observe { result in
            switch result {
                
            case .success(let data):
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
