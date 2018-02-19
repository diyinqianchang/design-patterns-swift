//
//  HTTPClient.swift
//  Future
//
//  Created by Zayats Oleh on 1/27/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import UIKit

protocol HTTPClientProtocol {
    func load(from url: URL) -> Future<Data>
}

class HTTPClient: HTTPClientProtocol {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func load(from url: URL) -> Future<Data> {
        return session.request(url: url)
    }
}

extension URLSession {
    func request(url: URL) -> Future<Data> {
        let promise = Promise<Data>()
        
        let task = dataTask(with: url) { data, _, error in
            if let error = error {
                promise.reject(with: error)
                
            } else if let data = data {
                promise.resolve(with: data)
                
            } else {
                // handle response
                // return custom error?
            }
        }
        task.resume()
        return promise
    }
}
