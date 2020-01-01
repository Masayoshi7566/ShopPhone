//
//  PhoneDetailsViewControllerTest.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 2/1/2563 BE.
//  Copyright © 2563 Orathai Udomluk. All rights reserved.
//

import XCTest
@testable import ShopPhone

class PhoneDetailsViewControllerTest: XCTestCase {
    
    var sut: PhoneDetailsViewController!
    var spyInteractor: PhoneDetailsBusinessLogicSpy!
    var window: UIWindow!

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupPhoneDetailsViewController()
    }

    override func tearDown() {
        spyInteractor = nil
        sut = nil
        window = nil
        super.tearDown()
    }

    func setupPhoneDetailsViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = (storyboard.instantiateViewController(withIdentifier: "PhoneDetailsViewController") as! PhoneDetailsViewController)

        spyInteractor = PhoneDetailsBusinessLogicSpy()
        sut.interactor = spyInteractor

        loadView()
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    //Get Phone Image List
     func testGetPhoneDetailImageList() {
        // Given
        // When
        loadView()
        // Then
        XCTAssertTrue(spyInteractor.getPhoneDetailImageListCalled, "getPhoneDetailImageList() should ask the interactor to get Phone Image List")
    }

    //Display Phone Image List
     func testGetAllPhoneListDataSuccess() {
        // Given
        let testData = TestListData.PhoneImage.iphone11ListImage
        let viewModel = PhoneDetails.PhoneImageList.ViewModel(result: testData)
        // When
        sut.getPhoneImageListDataSuccess(viewModel: viewModel)
        // Then
        XCTAssertEqual(viewModel.result?.imageURL, testData.imageURL, "getPhoneImageListDataSuccess(viewModel:) should should ask the interactor to get Phone Image by imageURL")
    }
    
}
