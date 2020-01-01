//
//  PhoneListInteractorTest.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 31/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import XCTest
@testable import ShopPhone

class PhoneListInteractorTest: XCTestCase {
    var sut: PhoneListInteractor!
    var spyPresenter: PhoneListPresentationLogicSpy!
    var spyWorker: PhoneListWorkerSpy!

    override func setUp() {
        super.setUp()
        setupPhoneListInteractor()
    }

    override func tearDown() {
        sut = nil
        spyPresenter = nil
        spyWorker = nil
        super.tearDown()
    }
    
    func setupPhoneListInteractor() {
        sut = PhoneListInteractor()
        
        spyPresenter = PhoneListPresentationLogicSpy()
        sut.presenter = spyPresenter
        
        spyWorker = PhoneListWorkerSpy()
        sut.phoneListWorker = spyWorker
    }
    
    class PhoneListWorkerSpy: PhoneListWorker {
        var getPhoneListDataTestCalled: Bool = false
        
        override func getPhoneListData(completion: @escaping (Result<PhoneDataModel>) -> Void) {
            getPhoneListDataTestCalled = true
        }
    }
    
    //Test
    func testGetPhoneListData() {
        // Given
        // When
        sut.getAllPhoneListData()
        // Then
        XCTAssertTrue(spyWorker.getPhoneListDataTestCalled, "getPhoneListData() should ask the worker to get All PhoneList Data")
    }
}
