//
//  PhoneDataModelTest.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 25/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import XCTest
@testable import ShopPhone

class PhoneDataModelTest: XCTestCase {
    
    var iphone11: PhoneDataModel!
    var galaxyNote10: PhoneDataModel!
    var huaweiP30: PhoneDataModel!
    
    override func setUp() {
        iphone11 = PhoneDataModel(id: 1, name: "iPhone 11", thumbImageURL: "https://com2ine.com/wp-content/uploads/2019/09/iphone11-endframe.jpg", phoneDescription: "A new dual‑camera system captures more of what you see and love. The fastest chip ever in a smartphone and all‑day battery life let you do more and charge less. And the highest‑quality video in a smartphone, so your memories look better than ever.", price: 699, brand: "Apple", rating: 4.8)
        galaxyNote10 = PhoneDataModel(id: 2, name: "iPhone 11", thumbImageURL: "https://www.khmertimeskh.com/wp-content/uploads/2019/08/P-Samsung-reveal_2.jpg", phoneDescription: "There's never a good time to be without power. Go for hours even after minutes of charging thanks to cutting-edge battery intelligence and Super Fast Charging.", price: 489.99, brand: "Samsung", rating: 4.7)
        huaweiP30 = PhoneDataModel(id: 3, name: "Huawei P30", thumbImageURL: "https://www.khmertimeskh.com/wp-content/uploads/2019/08/P-Samsung-reveal_2.jpg", phoneDescription: "The US government and Huawei have a shaky relationship right now, but that doesn't take away from the fact that Huawei's smartphones have become truly impressive. The Huawei P30 Pro's camera is particularly exciting, yet for US shoppers it's been hard to buy this Huawei phone or any flagship handset.The good news today is that B&H is offering pre-orders for all three phones in the Huawei P30 line: Huawei P30, Huawei P30 Pro, and Huawei P30 Lite. ", price: 319, brand: "Huawei", rating: 4.6)
    }

    override func tearDown() {
        iphone11 = nil
        galaxyNote10 = nil
        huaweiP30 = nil
    }

    func testExample() {
        XCTAssertTrue(galaxyNote10.price < iphone11.price)
    }

    func testPerformanceExample() {
        self.measure {
        }
    }

}
