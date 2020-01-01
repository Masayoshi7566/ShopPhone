//
//  PhoneDetailsPresenterTest.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 2/1/2563 BE.
//  Copyright © 2563 Orathai Udomluk. All rights reserved.
//

import XCTest
@testable import ShopPhone

class PhoneDetailsPresenterTest: XCTestCase {
    var sut: PhoneDetailsPresenter!
    var spyViewController: PhoneDetailsDisplayLogicSpy!

    override func setUp() {
        super.setUp()
        setupDetailsPresenter()
    }

    override func tearDown() {
        spyViewController = nil
        sut = nil
        super.tearDown()
    }
    
    func setupDetailsPresenter() {
        sut = PhoneDetailsPresenter()
        
        spyViewController = PhoneDetailsDisplayLogicSpy()
        sut.viewController = spyViewController
    }

    //Test
    func testPresentAllPhoneListData() {
        //Given
        let testData = TestListData.PhoneImage.iphone11ListImage
        
        //When
        let response = PhoneDetails.PhoneImageList.Response(result: testData)
        sut.presentPhoneImageListData(response: response)
        
        // Then
        XCTAssertTrue(spyViewController.getPhoneImageListDataSuccessCalled, "getPhoneImageListDataSuccessCalled(response:) should ask the view controller to display the result")
    }
}
