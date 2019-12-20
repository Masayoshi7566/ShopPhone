//
//  PhoneDetailsPresenter.swift
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

protocol PhoneDetailsPresentationLogic
{
  func presentSomething(response: PhoneDetails.Something.Response)
}

class PhoneDetailsPresenter: PhoneDetailsPresentationLogic
{
  weak var viewController: PhoneDetailsDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: PhoneDetails.Something.Response)
  {
    let viewModel = PhoneDetails.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
