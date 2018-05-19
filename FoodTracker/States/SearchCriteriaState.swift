//
//  SearchCriteriaState.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

struct SearchCriteriaState: StateType {
    var oxalateContent: OxalateContent
    var gfcfStatus: GFCFStatus
    var scdStatus: SCDStatus
    var salicylateContent: SalicylateContent
    var foodCategory: FoodCategory
    var foodName: String
    
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
    
    func apply(to foodItems: [FoodItem]) -> [FoodItem] {
        var filteredItems = oxalateContent.apply(to: foodItems)
        
        filteredItems = gfcfStatus.apply(to: filteredItems)
        filteredItems = scdStatus.apply(to: filteredItems)
        filteredItems = salicylateContent.apply(to: filteredItems)
        filteredItems = foodCategory.apply(to: filteredItems)

        if !self.foodName.isEmpty {
            filteredItems = filteredItems.filter { $0.name.uppercased().contains(self.foodName.uppercased()) }
        }
        
        return filteredItems
    }
}
