//
//  ImageLoader.swift
//  Caching
//
//  Created by Zayats Oleh on 1/28/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import UIKit

// ImageProvider uses networkClient to download image and caches it with NSCache

enum ImageProviderError: Error { case badURL, couldNotGetImageFromData }

typealias Cache = NSCache<NSString, AnyObject>

final class ImageProvider {
    private let httpClient: NetworkClientProtocol
    private let cache: Cache
    
    init(with httpClient: NetworkClientProtocol, cache: Cache = Cache()) {
        self.cache = cache
        self.httpClient = httpClient
    }
    
    func load(from urlString: String, _ completion: @escaping (_ result: Result<UIImage>, _ url: String) -> Void) -> URLSessionTask? {
        var task: URLSessionTask?
        
        async(.background) {
            
            // If image was cached previously:
            if let cachedImage = self.cache.object(forKey: urlString as NSString) as? UIImage {
                print("Got cached image")
                task?.cancel()
                completion(.success(cachedImage), urlString)
                return
            }
            
            guard let url = URL(string: urlString) else {
                let error: Result<UIImage> = .failure(ImageProviderError.badURL)
                completion(error, urlString)
                return
            }
            
            // if no image in cache - download it:
            task = self.httpClient.load(from: url, callback: { result in
                switch result {
                case .success(let data):
                    if let image = UIImage(data: data) {
                        
                        print("Got image from network")
                        self.cache.setObject(image as AnyObject, forKey: urlString as NSString)
                        completion(.success(image), urlString)
                        
                    } else {
                        completion(.failure(ImageProviderError.couldNotGetImageFromData), urlString)
                    }
                case .failure(let error):
                    completion(.failure(error), urlString)
                }
            })
        }
        return task
    }
}


