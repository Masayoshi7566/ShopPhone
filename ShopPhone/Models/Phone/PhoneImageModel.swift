//
//  PhoneImageModel.swift
//  ShopPhone
//
//  Created by GABLET04690 on 22/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PhoneImageModel {
    let id: Int
    let imageURL: String
    let mobileId: Int
}

extension PhoneImageModel: ModelProtocol {
    init(json: JSON) throws {
        guard let id = json["id"].int else { throw SerializerError.missing("id") }
        guard let imageURL = json["url"].string else { throw SerializerError.missing("url") }
        guard let mobileId = json["mobile_id"].int else { throw SerializerError.missing("mobile_id") }
        
        self.id = id
        self.imageURL = imageURL
        self.mobileId = mobileId
    }

    init?(json: [String : AnyObject]) {
        guard let id = json["id"] as? Int,
        let imageURL = json["url"] as? String,
        let mobileId = json["mobile_id"] as? Int
        else { return nil }
        
        self.id = id
        self.imageURL = imageURL
        self.mobileId = mobileId
    }
}
