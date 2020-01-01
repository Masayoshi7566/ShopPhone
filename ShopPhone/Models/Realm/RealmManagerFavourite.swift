//
//  RealmManagerFavourite.swift
//  ShopPhone
//
//  Created by GABLET04690 on 22/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

extension RealmManager {
    func addFavouritePhone(phoneData: PhoneDataModel) {
        let realm = try! Realm()
        let favouritePhoneId = FavouritePhone(phoneId: phoneData.id)
        try! realm.write {
            realm.add(favouritePhoneId, update: .all)
        }
    }
    
    func getAllFavoritePhoneId() -> [Int] {
        let realm = try! Realm()
        let allFavouriteId = realm.objects(FavouritePhone.self).map { $0.id } as [Int]
        return allFavouriteId
    }
    
    func isFavouritePhone(id: Int) -> Bool {
        let realm = try! Realm()
        let favouriteId = realm.objects(FavouritePhone.self).filter("id == %@", id)
        if favouriteId.count > 0 {
            return true
        }
        return false
    }
    
    func deleteFavouritePhone(id: Int) {
       let realm = try! Realm()
       let unFavouriteId = realm.objects(FavouritePhone.self).filter("id == %@", id)
       try! realm.write {
          realm.delete(unFavouriteId)
       }
    }
    
    func deleteAllFavouritePhone() {
       let realm = try! Realm()
       let allFavoriteData = realm.objects(FavouritePhone.self)
       try! realm.write {
           realm.delete(allFavoriteData)
       }
    }
}
    
