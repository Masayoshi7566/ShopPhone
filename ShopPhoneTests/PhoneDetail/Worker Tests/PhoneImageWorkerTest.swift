//
//  PhoneImageWorkerTest.swift
//  ShopPhoneTests
//
//  Created by GABLET04690 on 26/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import XCTest
import Moya
import Kingfisher
@testable import ShopPhone

class PhoneImageWorkerTest: XCTestCase {
    var sut: PhoneDetailsWorker!
    static var testPhoneImage: [PhoneImageModel]!
    let phoneImageTestServiceProvider = MoyaProvider<PhoneDataService>(stubClosure: MoyaProvider.immediatelyStub)

    override func setUp() {
        super.setUp()
        setupPhoneImageWorker()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func setupPhoneImageWorker() {
        sut = PhoneDetailsWorker()
        PhoneImageWorkerTest.testPhoneImage = [TestListData.PhoneImage.iphone11ListImage, TestListData.PhoneImage.galaxyNote10Image, TestListData.PhoneImage.huaweiP30Image]
    }
    
    //TEST Get Phone Image List
      func getPhoneImageListTest(result: Result<PhoneDataModelTest>, target: TargetType) {
          let Id: Int = 1
          let phoneImageList = [PhoneImageModel]()
          guard let apiTarget = target as? PhoneDataService, case .getPhoneImage(phoneId: Id) = apiTarget else {
             return XCTFail("unexpect target")
          }
          phoneImageTestServiceProvider.request(.getPhoneImage(phoneId: Id), completion: { (result) in
            self.expectation(description: "Status code: 200").fulfill()
          })
          
          waitForExpectations(timeout: 5) { error in
                 if let error = error {
                     print("Error: \(error.localizedDescription)")
              }
          }
        
        XCTAssertEqual(phoneImageList.count, PhoneImageWorkerTest.testPhoneImage.count, "getPhoneImageList() should return a list of Phone Image Model")
      }
      
      //TEST Get Phone Image in Phone Detail Screen
      func getPhoneDetailsImageTest(result: Result<UIImage>) {
    
          guard let phoneImageURL = URL.init(string: "https://com2ine.com/wp-content/uploads/2019/09/iphone11-endframe.jpg" ) else { return }
          KingfisherManager.shared.downloader.downloadImage(with: phoneImageURL, options: nil, progressBlock: nil, completionHandler: { result in
              self.expectation(description: "Status code: 200").fulfill()
          })
          
          waitForExpectations(timeout: 5) { error in
              if let error = error {
                  print("Error: \(error.localizedDescription)")
              }
          }
      }
}

