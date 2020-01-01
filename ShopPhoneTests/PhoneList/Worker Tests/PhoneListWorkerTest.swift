//
//  PhoneListWorkerTest.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 26/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import XCTest
import Moya
import UIKit
@testable import ShopPhone

class PhoneListWorkerTest: XCTestCase {
       var sut: PhoneListWorker!
       static var testPhoneList: [PhoneDataModel]!
    
       let phoneDataTestServiceProvider = MoyaProvider<PhoneDataService>(stubClosure: MoyaProvider.immediatelyStub)
        
       override func setUp() {
            super.setUp()
            setupPhoneListWorker()
        }
    
        override func tearDown() {
            sut = nil
            super.tearDown()
        }
    
    func setupPhoneListWorker() {
        sut = PhoneListWorker()
        PhoneListWorkerTest.testPhoneList = [TestListData.PhoneList.iphone11, TestListData.PhoneList.galaxyNote10, TestListData.PhoneList.huaweiP30]
    }
    
    func getPhoneListDataTest(completion: @escaping (Result<PhoneDataModel>) -> Void) {
        let expectation = self.expectation(description: "calls the callback with a resource object")
        var phoneList = [Any]()
        
        sut.getPhoneListData(completion: { (result) in
            switch result {
            case .Success(let response):
                    phoneList.append(response)
                    XCTAssertEqual(phoneList.count, PhoneListWorkerTest.testPhoneList.count, "getAllPhoneList() should return a list of PhoneDataModel")
                    expectation.fulfill()
            case .Error(let error):
                XCTAssertNotNil(error)
                expectation.fulfill()
                print("Error Get PhoneList Data : \(error)")
            }
        })
        
        waitForExpectations(timeout: 5) { error in
        if let error = error {
              print("Error: \(error.localizedDescription)")
            }
        }
    }
}
