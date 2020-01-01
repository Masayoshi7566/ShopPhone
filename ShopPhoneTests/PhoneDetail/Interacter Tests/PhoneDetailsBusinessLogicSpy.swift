//
//  PhoneDetailsBusinessLogicSpy.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 1/1/2563 BE.
//  Copyright © 2563 Orathai Udomluk. All rights reserved.
//

import Foundation
@testable import ShopPhone

class PhoneDetailsBusinessLogicSpy: PhoneDetailsBusinessLogic {
    
    var getPhoneDetailImageListCalled: Bool = false
    var getPhoneDetailImageCalled: Bool = false
    var getPhoneDetailCalled: Bool = false
    
    func getPhoneDetailImageList() {
        getPhoneDetailImageListCalled = true
    }
    
    func getPhoneDetailImage(imageURL: String) {
        getPhoneDetailImageCalled = true
    }
    
    func getPhoneDetail(phoneName: inout String, description: inout String, phonePrice: inout Double, phoneRating: inout Double) {
        getPhoneDetailCalled = true
    }
}
