//
//  FoodItem.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/2/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class FoodItem: Object {
    enum Property: String {
        case id, name, oxalateContent, gfcfStatus, scdStatus, salicylateContent, category
    }

    dynamic var id = UUID().uuidString
    dynamic var name: String = ""
    @objc dynamic private var _oxalateContent = OxalateContent.all.rawValue
    @objc dynamic private var _gfcfStatus = GFCFStatus.all.rawValue
    @objc dynamic private var _scdStatus = SCDStatus.all.rawValue
    @objc dynamic private var _salicylateContent = SalicylateContent.all.rawValue
    @objc dynamic private var _category = FoodCategory.all.rawValue
    
    override static func primaryKey() -> String? {
        return FoodItem.Property.id.rawValue
    }
    
    var oxalateContent: OxalateContent {
        get { return OxalateContent(rawValue: _oxalateContent) ?? OxalateContent.all }
        set { _oxalateContent = newValue.rawValue }
    }
    
    var gfcfStatus: GFCFStatus {
        get { return GFCFStatus(rawValue: _gfcfStatus) ?? GFCFStatus.all }
        set { _gfcfStatus = newValue.rawValue }
    }

    var scdStatus: SCDStatus {
        get { return SCDStatus(rawValue: _scdStatus) ?? SCDStatus.all }
        set { _scdStatus = newValue.rawValue }
    }

    var salicylateContent: SalicylateContent {
        get { return SalicylateContent(rawValue: _salicylateContent) ?? SalicylateContent.all }
        set { _salicylateContent = newValue.rawValue }
    }
    
    var category: FoodCategory {
        get { return FoodCategory(rawValue: _category) ?? FoodCategory.all }
        set { _category = newValue.rawValue }
    }
    
    convenience init(name: String = "",
                     oxalateContent: OxalateContent = .all,
                     gfcfStatus: GFCFStatus = .all,
                     scdStatus: SCDStatus = .all,
                     salicylateContent: SalicylateContent = .all,
                     category: FoodCategory = .all) {
        self.init()
        self.name = name
        self.oxalateContent = oxalateContent
        self.gfcfStatus = gfcfStatus
        self.scdStatus = scdStatus
        self.salicylateContent = salicylateContent
        self.category = category
    }
}



// MARK: - CRUD methods

extension FoodItem {
    
    static func allAsArray(in realm: Realm = try! Realm()) -> [FoodItem] {
        var returnArray = [FoodItem]()
        
        for foodItem in FoodItem.all(in: realm) {
            returnArray.append(foodItem)
        }
                
        return returnArray
    }
    
    static func all(in realm: Realm = try! Realm()) -> Results<FoodItem> {
        return realm.objects(FoodItem.self)
            .sorted(byKeyPath: FoodItem.Property.name.rawValue)
    }
    
    @discardableResult
    static func add(text: String, in realm: Realm = try! Realm()) -> FoodItem {
        let item = FoodItem()
        try! realm.write {
            realm.add(item)
        }
        return item
    }
 
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}



