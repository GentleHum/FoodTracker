//
//  RealmProvider.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/24/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import RealmSwift

struct RealmProvider {
    let configuration: Realm.Configuration
    
    internal init(config: Realm.Configuration) {
        configuration = config
    }
    
    var realm: Realm {
        return try! Realm(configuration: configuration)
    }
    
    private static let foodItemConfig = Realm.Configuration(
        fileURL: try! Path.inLibrary("FoodItem.realm"),
        schemaVersion: 1,
        deleteRealmIfMigrationNeeded: true,
        objectTypes: [FoodItem.self])
    
    public static var foodItems: RealmProvider = {
        return RealmProvider(config: foodItemConfig)
    }()
}
