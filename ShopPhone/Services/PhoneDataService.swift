//
//  PhoneDataService.swift
//  PhoneShop
//
//  Created by GABLET04690 on 12/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import Foundation
import Moya

enum PhoneDataService {
    case getPhoneListData
    case getPhoneImage(phoneId: Int)
}

extension PhoneDataService: TargetType {
    
    var baseURL: URL { return URL(string: "https://scb-test-mobile.herokuapp.com")! }
    
    var path: String {
        switch self {
        case .getPhoneListData:
            return "/api/mobiles/"
        case .getPhoneImage(phoneId: let id):
            return "/api/mobiles/\(id)/images/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPhoneListData , .getPhoneImage:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getPhoneListData:
            return "{\"brand\": \"Samsung\", \"rating\": 4.9, \"id\": 1, \"description\": \"First place in our list goes to the excellent Moto E4 Plus.\", \"name\": \"Moto E4 Plus\", \"thumbImageURL\": \"https://cdn.mos.cms.futurecdn.net/grwJkAGWQp4EPpWA3ys3YC-650-80.jpg\", \"price\": 179.99 }".utf8Encoded
        case .getPhoneImage(phoneId: let id):
            return "{\"mobile_id\": \(id), \"url\": \"https://www.91-img.com/gallery_images_uploads/f/c/fc3fba717874d64cf15d30e77a16617a1e63cc0b.jpg\", \"id\": 1 }".utf8Encoded
        }
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}

extension String {
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
