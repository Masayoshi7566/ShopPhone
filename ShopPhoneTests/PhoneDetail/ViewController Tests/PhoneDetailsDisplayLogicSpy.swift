//
//  PhoneDetailsDisplayLogicSpy.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 2/1/2563 BE.
//  Copyright © 2563 Orathai Udomluk. All rights reserved.
//

import Foundation
@testable import ShopPhone

class PhoneDetailsDisplayLogicSpy: PhoneDetailsDisplayLogic {
    
    var getPhoneImageListDataSuccessCalled: Bool = false
    var getPhoneImageListDataFailedCalled: Bool = false
    var getPhoneImageSuccessCalled: Bool = false
    var showAlertCannotGetPhoneImageCalled: Bool = false
    
    func getPhoneImageListDataSuccess(viewModel: PhoneDetails.PhoneImageList.ViewModel) {
        getPhoneImageListDataSuccessCalled = true
    }
    
    func getPhoneImageListDataFailed() {
        getPhoneImageListDataFailedCalled = true
    }
    
    func getPhoneImageSuccess(viewModel: PhoneDetails.PhoneImage.ViewModel) {
        getPhoneImageSuccessCalled = true
    }
    
    func showAlertCannotGetPhoneImage() {
        showAlertCannotGetPhoneImageCalled = true
    }
}
