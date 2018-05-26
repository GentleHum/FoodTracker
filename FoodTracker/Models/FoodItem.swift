//
//  FoodItem.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/2/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import RealmSwift


@objcMembers class FoodItem: Object {
    enum Property: String {
        case id, name, category, oxalateContent, salicylateContent, amineContent, gfcfStatus, scdStatus, paleoStatus, fodmapStatus
    }

    dynamic var id = UUID().uuidString
    dynamic var name: String = ""
    @objc dynamic private var _category = FoodCategory.all.rawValue

    // food compound types
    @objc dynamic private var _oxalateContent = OxalateContent.varies.rawValue
    @objc dynamic private var _salicylateContent = SalicylateContent.varies.rawValue
    @objc dynamic private var _amineContent = AmineContent.varies.rawValue

    // diet types
    @objc dynamic private var _gfcfStatus = GFCFStatus.yes.rawValue
    @objc dynamic private var _scdStatus = SCDStatus.yes.rawValue
    @objc dynamic private var _paleoStatus = PaleoStatus.yes.rawValue
    @objc dynamic private var _fodmapStatus = FodmapStatus.yes.rawValue

    override static func primaryKey() -> String? {
        return FoodItem.Property.id.rawValue
    }
    
    var category: FoodCategory {
        get { return FoodCategory(rawValue: _category) ?? FoodCategory.all }
        set { _category = newValue.rawValue }
    }

    var oxalateContent: OxalateContent {
        get { return OxalateContent(rawValue: _oxalateContent) ?? OxalateContent.all }
        set { _oxalateContent = newValue.rawValue }
    }
    
    var salicylateContent: SalicylateContent {
        get { return SalicylateContent(rawValue: _salicylateContent) ?? SalicylateContent.all }
        set { _salicylateContent = newValue.rawValue }
    }

    var amineContent: AmineContent {
        get { return AmineContent(rawValue: _amineContent) ?? AmineContent.all }
        set { _amineContent = newValue.rawValue }
    }

    var gfcfStatus: GFCFStatus {
        get { return GFCFStatus(rawValue: _gfcfStatus) ?? GFCFStatus.all }
        set { _gfcfStatus = newValue.rawValue }
    }

    var scdStatus: SCDStatus {
        get { return SCDStatus(rawValue: _scdStatus) ?? SCDStatus.all }
        set { _scdStatus = newValue.rawValue }
    }

    var paleoStatus: PaleoStatus {
        get { return PaleoStatus(rawValue: _paleoStatus) ?? PaleoStatus.all }
        set { _paleoStatus = newValue.rawValue }
    }
    
    var fodmapStatus: FodmapStatus {
        get { return FodmapStatus(rawValue: _fodmapStatus) ?? FodmapStatus.all }
        set { _fodmapStatus = newValue.rawValue }
    }

    
    convenience init(name: String = "",
                     category: FoodCategory = .all,
                     oxalateContent: OxalateContent = .varies,
                     salicylateContent: SalicylateContent = .varies,
                     amineContent: AmineContent = .varies,
                     gfcfStatus: GFCFStatus = .yes,
                     scdStatus: SCDStatus = .yes,
                     paleoStatus: PaleoStatus = .yes,
                     fodmapStatus: FodmapStatus = .yes) {
        self.init()
        self.name = name
        self.category = category
        
        self.oxalateContent = oxalateContent
        self.salicylateContent = salicylateContent
        self.amineContent = amineContent

        self.gfcfStatus = gfcfStatus
        self.scdStatus = scdStatus
        self.paleoStatus = paleoStatus
        self.fodmapStatus = fodmapStatus

    }
}



// MARK: - CRUD methods

extension FoodItem {
    
    static func allAsArray(in realm: Realm) -> [FoodItem] {
        var returnArray = [FoodItem]()
        
        for foodItem in FoodItem.all(in: realm) {
            returnArray.append(foodItem)
        }
                
        return returnArray
    }
    
    static func all(in realm: Realm) -> Results<FoodItem> {
        return realm.objects(FoodItem.self)
            .sorted(byKeyPath: FoodItem.Property.name.rawValue)
    }
    
//    @discardableResult
//    static func add(text: String, in realm: Realm) -> FoodItem {
//        let item = FoodItem()
//        try! realm.write {
//            realm.add(item)
//        }
//        return item
//    }
 
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}



