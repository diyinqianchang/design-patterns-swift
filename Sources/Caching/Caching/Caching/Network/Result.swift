//
//  Result.swift
//  Caching
//
//  Created by Zayats Oleh on 1/28/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T), failure(Error)
}

extension Result {
    init(_ throwExpression: () throws -> T) {
        do {
            let value = try throwExpression()
            self = Result.success(value)
        } catch {
            self = Result.failure(error)
        }
    }
}
