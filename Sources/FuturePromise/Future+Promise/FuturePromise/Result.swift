//
//  Result.swift
//  FuturePromise
//
//  Created by Oleh Zayats on 2/19/18.
//  Copyright © 2018 Oleh Zayats. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
