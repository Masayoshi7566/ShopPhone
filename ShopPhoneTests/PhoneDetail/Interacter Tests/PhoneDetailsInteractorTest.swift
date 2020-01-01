//
//  PhoneDetailsInteractorTest.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 2/1/2563 BE.
//  Copyright © 2563 Orathai Udomluk. All rights reserved.
//

import XCTest
@testable import ShopPhone

class PhoneDetailsInteractorTest: XCTestCase {
    var sut: PhoneDetailsInteractor!
    var spyPresenter: PhoneDetailsPresentationLogicSpy!
    var spyWorker: PhoneDetailsWorkerSpy!

    override func setUp() {
        super.setUp()
        setupPhoneDetailsInteractor()
    }

    override func tearDown() {
        sut = nil
        spyPresenter = nil
        spyWorker = nil
        super.tearDown()
    }

    func setupPhoneDetailsInteractor() {
        sut = PhoneDetailsInteractor()
        
        spyPresenter = PhoneDetailsPresentationLogicSpy()
        sut.presenter = spyPresenter
        
        spyWorker = PhoneDetailsWorkerSpy()
        sut.phoneDetailsWorker = spyWorker
    }
    
    class PhoneDetailsWorkerSpy: PhoneDetailsWorker {
        
        var getPhoneImageListCalled: Bool = false
        var getPhoneDetailsImageCalled: Bool = false
        
        override func getPhoneImageList(Id: Int, completion: @escaping (Result<PhoneImageModel>) -> Void) {
            getPhoneImageListCalled = true
        }
        
        override func getPhoneDetailsImage(url: String, completion: @escaping (Result<UIImage>) -> Void) {
            getPhoneDetailsImageCalled = true
        }
    }
    
    //Test
    func testGetPhoneListData() {
        // Given
        // When
        sut.getPhoneDetailImageList()
        // Then
        XCTAssertTrue(spyWorker.getPhoneImageListCalled, "getPhoneImageList() should ask the worker to get Phone Image List")
    }

}
