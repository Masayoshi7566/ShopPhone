//
//  PhoneListPresentationLogicSpy.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 31/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

@testable import ShopPhone

class PhoneListPresentationLogicSpy: PhoneListPresentationLogic {
    var presentAllPhoneListDataCalled: Bool = false
    var presentPhoneDetailsCalled: Bool = false
    var presentUpdateFavouritePhoneCellCalled: Bool = false
    var presentFavouritePhoneDataCalled: Bool = false
    var presentAlertConnectionFailCalled: Bool = false
    
    func presentAllPhoneListData(response: PhoneList.PhoneData.Response) {
       presentAllPhoneListDataCalled = true
    }
    
    func presentPhoneDetails() {
        presentPhoneDetailsCalled = true
    }
    
    func presentUpdateFavouritePhoneCell() {
        presentUpdateFavouritePhoneCellCalled = true
    }
    
    func presentFavouritePhoneData(response: PhoneList.PhoneFavourite.Response) {
        presentFavouritePhoneDataCalled = true
    }
    
    func presentAlertConnectionFail() {
        presentAlertConnectionFailCalled = true
    }
}
