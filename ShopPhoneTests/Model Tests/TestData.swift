//
//  TestData.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 26/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import XCTest
@testable import ShopPhone

struct TestListData {
      struct PhoneList {
        static let iphone11 = PhoneDataModel(id: 1, name: "iPhone 11", thumbImageURL: "https://com2ine.com/wp-content/uploads/2019/09/iphone11-endframe.jpg", phoneDescription: "A new dual‑camera system captures more of what you see and love. The fastest chip ever in a smartphone and all‑day battery life let you do more and charge less. And the highest‑quality video in a smartphone, so your memories look better than ever.", price: 699, brand: "Apple", rating: 4.8)
        static let galaxyNote10 = PhoneDataModel(id: 2, name: "iPhone 11", thumbImageURL: "https://www.khmertimeskh.com/wp-content/uploads/2019/08/P-Samsung-reveal_2.jpg", phoneDescription: "There's never a good time to be without power. Go for hours even after minutes of charging thanks to cutting-edge battery intelligence and Super Fast Charging.", price: 489.99, brand: "Samsung", rating: 4.7)
        static let huaweiP30 = PhoneDataModel(id: 3, name: "Huawei P30", thumbImageURL: "https://img.kapook.com/content_upload2/images/P30_2(2).jpg", phoneDescription: "The US government and Huawei have a shaky relationship right now, but that doesn't take away from the fact that Huawei's smartphones have become truly impressive. The Huawei P30 Pro's camera is particularly exciting, yet for US shoppers it's been hard to buy this Huawei phone or any flagship handset.The good news today is that B&H is offering pre-orders for all three phones in the Huawei P30 line: Huawei P30, Huawei P30 Pro, and Huawei P30 Lite. ", price: 319, brand: "Huawei", rating: 4.6)
    }
    
    struct PhoneImage {
        static let iphone11ListImage = PhoneImageModel(id: 1, imageURL: "https://www.techoffside.com/wp-content/uploads/2019/09/iphone-11-all-color.jpg", mobileId: 1)
        static let galaxyNote10Image = PhoneImageModel(id: 2, imageURL: "https://upload.wikimedia.org/wikipedia/commons/6/6d/Samsung_Galaxy_Note_10_%28front%29.jpg", mobileId: 2)
        static let huaweiP30Image = PhoneImageModel(id: 3, imageURL: "https://img.kapook.com/content_upload2/images/P30_2(2).jpg", mobileId: 3)
    }
}

