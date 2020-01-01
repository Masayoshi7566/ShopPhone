//
//  PhoneListRoutingLogicSpy.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 31/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import Foundation
import UIKit
@testable import ShopPhone

class PhoneListRoutingLogicSpy: NSObject, PhoneListRoutingLogic, PhoneListDataPassing {
    var dataStore: PhoneListDataStore?
    var routeToPhoneDetailsCalled: Bool = false
    
    func routeToPhoneDetails(segue: UIStoryboardSegue?) {
        routeToPhoneDetailsCalled = true
    }
}

