//
//  UpdateSearchCriteriaAction.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/2/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

struct UpdateSearchCriteriaAction: Action {
    let oxalateContent: OxalateContent
    let gfcfStatus: GFCFStatus
    let scdStatus: SCDStatus
    let salicylateContent: SalicylateContent
    let foodCategory: FoodCategory
    let foodName: String
    
    init(oxalateContent: OxalateContent = .all, gfcfStatus: GFCFStatus = .all,
         scdStatus: SCDStatus = .all, salicylateContent: SalicylateContent = .all,
         foodCategory: FoodCategory = .all,
         foodName: String = "") {
        self.oxalateContent = oxalateContent
        self.gfcfStatus = gfcfStatus
        self.scdStatus = scdStatus
        self.salicylateContent = salicylateContent
        self.foodCategory = foodCategory
        self.foodName = foodName
    }
}
