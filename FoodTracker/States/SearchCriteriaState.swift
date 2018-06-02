//
//  SearchCriteriaState.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

struct SearchCriteriaState: StateType {
    var oxalateContent: [OxalateContent]
    var salicylateContent: [SalicylateContent]
    var amineContent: [AmineContent]

    var gfcfStatus: GFCFStatus
    var scdStatus: SCDStatus
    var paleoStatus: PaleoStatus
    var fodmapStatus: FodmapStatus

    var foodCategory: [FoodCategory]
    var foodName: String
    
    init(oxalateContent: [OxalateContent] = [],
         salicylateContent: [SalicylateContent] = [],
         amineContent: [AmineContent] = [],
         gfcfStatus: GFCFStatus = .all, scdStatus: SCDStatus = .all,
         paleoStatus: PaleoStatus = .all, fodmapStatus: FodmapStatus = .all,
         foodCategory: [FoodCategory] = [],
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
    
    func apply(to foodItems: [FoodItem]) -> [FoodItem] {
        var filteredItems = FoodItem.apply(oxalateContent, to: foodItems)

        filteredItems = FoodItem.apply(salicylateContent, to: filteredItems)
        filteredItems = FoodItem.apply(amineContent, to: filteredItems)

        filteredItems = gfcfStatus.apply(to: filteredItems)
        filteredItems = scdStatus.apply(to: filteredItems)
        filteredItems = paleoStatus.apply(to: filteredItems)
        filteredItems = fodmapStatus.apply(to: filteredItems)
        
        filteredItems = FoodItem.apply(foodCategory, to: filteredItems)

        if !self.foodName.isEmpty {
            filteredItems = filteredItems.filter { $0.name.uppercased().contains(self.foodName.uppercased()) }
        }
        
        return filteredItems
    }
}
