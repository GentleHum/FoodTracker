//
//  FoodItem.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/2/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import Foundation

struct FoodItem {
    let name: String
    let oxalateContent: OxalateContent
    let gfcfStatus: GFCFStatus
    let scdStatus: SCDStatus
    let salicylateContent: SalicylateContent
    let category: FoodCategory
    
    init(name: String, oxalateContent: OxalateContent, gfcfStatus: GFCFStatus, scdStatus: SCDStatus,
         salicylateContent: SalicylateContent, category: FoodCategory) {
        self.name = name
        self.oxalateContent = oxalateContent
        self.gfcfStatus = gfcfStatus
        self.scdStatus = scdStatus
        self.salicylateContent = salicylateContent
        self.category = category
    }
}
