//
//  PhoneListBusinessLogicSpy.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 30/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import Foundation
@testable import ShopPhone

class PhoneListBusinessLogicSpy : PhoneListBusinessLogic {
    
    var addFavoritePhoneCalled: Bool = false
    var passDataToPhoneDetailsCalled: Bool = false
    var getAllPhoneListDataCalled: Bool = false
    var getFavouritePhoneDataCalled: Bool = false
    var unFavouritePhoneCalled: Bool = false
    
    func addFavoritePhone(request: PhoneList.PhoneFavourite.Request) {
        addFavoritePhoneCalled = true
    }
    
    func passDataToPhoneDetails(request: PhoneList.PhoneDetails.Request) {
        passDataToPhoneDetailsCalled = true
    }
    
    func getAllPhoneListData() {
        getAllPhoneListDataCalled = true
    }
    
    func getFavouritePhoneData() {
        getFavouritePhoneDataCalled = true
    }
    
    func unFavouritePhone(id: Int) {
        unFavouritePhoneCalled = true
    }
    
}
