//
//  RealmManager.swift
//  ShopPhone
//
//  Created by GABLET04690 on 22/12/2562 BE.
//  Copyright © 2562 Orathai Udomluk. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

protocol RealmManagerProtocol {

    func addFavouritePhone(phoneData: PhoneDataModel)
    func isFavouritePhone(id: Int) -> Bool
    func getAllFavoritePhoneId() -> [Int] 
    func deleteFavouritePhone(id: Int)
    func deleteAllFavouritePhone()
}

class RealmManager: NSObject, RealmManagerProtocol {
    var schemaRealmVersion: UInt64 = 0
    let realmConfig = Realm.Configuration()
    
    func configMigrateRealm() {
        do {
             schemaRealmVersion = try schemaVersionAtURL(realmConfig.fileURL!)
        } catch  {
             print("Error to Find schema realm version : \(error)")
        }
        
        let config = Realm.Configuration(
            schemaVersion: schemaRealmVersion,
            migrationBlock: { migration, oldSchemaVersion in
                //Do SomeThing When Update Realm
            })

        Realm.Configuration.defaultConfiguration = config
    }
    
    func clearFavouriteData() {
        deleteAllFavouritePhone()
    }
}
