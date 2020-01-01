//
//  PhoneDetailsPresentationLogicSpy.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 2/1/2563 BE.
//  Copyright © 2563 Orathai Udomluk. All rights reserved.
//

import Foundation
@testable import ShopPhone

class PhoneDetailsPresentationLogicSpy: PhoneDetailsPresentationLogic {
    
    var presentPhoneImageListDataCalled: Bool = false
    var presentPhoneImageCalled: Bool = false
    var presentAlertCannotGetPhoneImageCalled: Bool = false
    
    func presentPhoneImageListData(response: PhoneDetails.PhoneImageList.Response) {
        presentPhoneImageListDataCalled = true
    }
    
    func presentPhoneImage(response: PhoneDetails.PhoneImage.Response) {
        presentPhoneImageCalled = true
    }
    
    func presentAlertCannotGetPhoneImage() {
        presentAlertCannotGetPhoneImageCalled = true
    }
    
}
