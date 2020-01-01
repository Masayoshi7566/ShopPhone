//
//  PhoneListViewControllerTest.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 31/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import XCTest
@testable import ShopPhone

class PhoneListViewControllerTest: XCTestCase {
    
    var sut: PhoneListViewController!
    var spyInteractor: PhoneListBusinessLogicSpy!
    var spyRouter: PhoneListRoutingLogicSpy!
    var window: UIWindow!

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupPhoneListViewController()
    }

    override func tearDown() {
        spyInteractor = nil
        spyRouter = nil
        sut = nil
        window = nil
        super.tearDown()
    }

    func setupPhoneListViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = (storyboard.instantiateViewController(withIdentifier: "PhoneListViewController") as! PhoneListViewController)

        spyInteractor = PhoneListBusinessLogicSpy()
        sut.interactor = spyInteractor

        spyRouter = PhoneListRoutingLogicSpy()
        sut.router = spyRouter

        loadView()
    }

     func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    //Get All Phone List
     func testGetAllPhoneListData() {
        // Given
        
        // When
        loadView()
        // Then
        XCTAssertTrue(spyInteractor.getAllPhoneListDataCalled, "getAllPhoneListData() should ask the interactor to get all PhoneList Data")
    }

    //Display Phone List
     func testGetAllPhoneListDataSuccess() {
        // Given
        let testData = TestListData.PhoneList.iphone11
        let viewModel = PhoneList.PhoneData.ViewModel(result: testData)
        // When
        sut.getAllPhoneListDataSuccess(viewModel: viewModel)
        // Then
        XCTAssertEqual(sut.allPhoneList, [testData], "getAllPhoneListDataSuccess(viewModel:) should append in all phone list array")
    }
    
    class TableViewSpy: UITableView {
      var reloadDataCalled = false
        
      override func reloadData() {
        reloadDataCalled = true
      }
    }
    
    //Display Table View
    func testDisplayTableView() {
      // Given
      let tableViewSpy = TableViewSpy()
      sut.phoneListTable = tableViewSpy
      
      // When
      let displayedOrders = TestListData.PhoneList.galaxyNote10
      let viewModel = PhoneList.PhoneData.ViewModel(result: displayedOrders)
      sut.getAllPhoneListDataSuccess(viewModel: viewModel)
      
      // Then
      XCTAssert(tableViewSpy.reloadDataCalled, "Display Phone List Data, should reload the table view")
    }
}

