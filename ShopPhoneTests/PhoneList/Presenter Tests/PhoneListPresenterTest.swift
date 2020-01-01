//
//  PhoneListPresenterTest.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 26/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import XCTest
@testable import ShopPhone

class PhoneListPresenterTest: XCTestCase {
    var sut: PhoneListPresenter!
    var spyViewController: PhoneListDisplayLogicSpy!

    override func setUp() {
        super.setUp()
        setupPhoneListPresenter()
    }

    override func tearDown() {
        spyViewController = nil
        sut = nil
        super.tearDown()
    }
    
    func setupPhoneListPresenter() {
        sut = PhoneListPresenter()
        
        spyViewController = PhoneListDisplayLogicSpy()
        sut.viewController = spyViewController
    }
    
    //Test
    func testPresentAllPhoneListData() {
        //Given
        let testData = TestListData.PhoneList.iphone11
        
        //When
        let response = PhoneList.PhoneData.Response(result: testData)
        sut.presentAllPhoneListData(response: response)
        
        // Then
        XCTAssertTrue(spyViewController.getAllPhoneListDataSuccessCalled, "getAllPhoneListDataSuccess(response:) should ask the view controller to display the result")
    }
}
