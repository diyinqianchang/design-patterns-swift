//
//  File.swift
//  Caching
//
//  Created by Zayats Oleh on 1/28/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

enum HTTPError: Error { case noData }

protocol NetworkClientProtocol {
    func load(from url: URL, callback: @escaping (Result<Data>) -> Void) -> URLSessionTask
}

struct NetworkClient: NetworkClientProtocol {
    private let session: URLSession
    
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    func load(from url: URL, callback: @escaping (Result<Data>) -> Void) -> URLSessionTask {
        let task = session.dataTask(with: url) { (data, response, error) in
            callback(Result.init{
                
                // proper http response handling should be provided...
                // omitted for brevity
                
                if let error = error { throw error }
                guard let data = data else { throw HTTPError.noData }
                
                return data
            })
        }
        task.resume()
        return task
    }
}
