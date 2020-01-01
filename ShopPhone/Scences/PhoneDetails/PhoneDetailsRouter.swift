//
//  PhoneDetailsRouter.swift
//  ShopPhone
//
//  Created by GABLET04690 on 20/12/2562 BE.
//  Copyright (c) 2562 Orathai Udomluk. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol PhoneDetailsRoutingLogic {

}

protocol PhoneDetailsDataPassing {
  var dataStore: PhoneDetailsDataStore? { get }
}

class PhoneDetailsRouter: NSObject, PhoneDetailsRoutingLogic, PhoneDetailsDataPassing {
  weak var viewController: PhoneDetailsViewController?
  var dataStore: PhoneDetailsDataStore?
  
}
