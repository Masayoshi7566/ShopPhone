//
//  ModelProtocol.swift
//  ShopPhone
//
//  Created by GABLET04690 on 21/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import Foundation

enum SerializerError: Error {
    case missing(String)
    case invalid(String, Any)
}

protocol ModelProtocol {
    init?(json: [String:AnyObject])
}

enum Result<T> {
    case Success(T)
    case Error(Error)
}

//Remove Duplicate Data
extension Array where Element: Equatable {
    func removeDuplicate() -> [Element] {
        var result = [Element]()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
}
