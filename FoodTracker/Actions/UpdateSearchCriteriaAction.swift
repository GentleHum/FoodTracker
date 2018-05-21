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
    let salicylateContent: SalicylateContent
    let amineContent: AmineContent

    let gfcfStatus: GFCFStatus
    let scdStatus: SCDStatus
    let paleoStatus: PaleoStatus
    let fodmapStatus: FodmapStatus

    let foodCategory: FoodCategory
    let foodName: String

    init(oxalateContent: OxalateContent = .all, salicylateContent: SalicylateContent = .all,
         amineContent: AmineContent = .all,
         gfcfStatus: GFCFStatus = .all, scdStatus: SCDStatus = .all,
         paleoStatus: PaleoStatus = .all, fodmapStatus: FodmapStatus = .all,
         foodCategory: FoodCategory = .all,
         foodName: String = "") {
        self.oxalateContent = oxalateContent
        self.salicylateContent = salicylateContent
        self.amineContent = amineContent

        self.gfcfStatus = gfcfStatus
        self.scdStatus = scdStatus
        self.paleoStatus = paleoStatus
        self.fodmapStatus = fodmapStatus

        self.foodCategory = foodCategory
        self.foodName = foodName
    }
}
