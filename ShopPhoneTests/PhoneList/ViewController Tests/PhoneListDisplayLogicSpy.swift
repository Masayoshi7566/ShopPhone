//
//  PhoneListDisplayLogicSpy.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 30/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import Foundation
@testable import ShopPhone

class PhoneListDisplayLogicSpy: PhoneListDisplayLogic {
    var getAllPhoneListDataSuccessCalled = false
    var getAllPhoneListDataSuccessViewModel: PhoneList.PhoneData.ViewModel?
    var getAllPhoneListDataFailedCalled = false
    var navigateToPhoneDetailsCalled = false
    var updateFavouritePhoneCellCalled = false
    var showAlertConnectionFailCalled = false
    var getFavouritePhoneDataCalled = false
    var getFavouritePhoneDataViewModel: PhoneList.PhoneFavourite.ViewModel?
    
    func getAllPhoneListDataSuccess(viewModel: PhoneList.PhoneData.ViewModel) {
        getAllPhoneListDataSuccessCalled = true
        getAllPhoneListDataSuccessViewModel = viewModel
    }
    
    func getAllPhoneListDataFailed() {
        getAllPhoneListDataFailedCalled = true
    }
    
    func navigateToPhoneDetails() {
        navigateToPhoneDetailsCalled = true
    }
    
    func updateFavouritePhoneCell() {
        updateFavouritePhoneCellCalled = true
    }
    
    func showAlertConnectionFail() {
        showAlertConnectionFailCalled = true
    }
    
    func getFavouritePhoneData(viewModel: PhoneList.PhoneFavourite.ViewModel) {
        getFavouritePhoneDataCalled = true
        getFavouritePhoneDataViewModel = viewModel
    }
}
