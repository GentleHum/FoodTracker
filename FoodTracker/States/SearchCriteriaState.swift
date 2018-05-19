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
        var filteredItems = foodItems
        
        if self.oxalateContent != .all {
            filteredItems = filteredItems.filter { $0.oxalateContent == self.oxalateContent }
        }
        
        if self.gfcfStatus != .all {
            filteredItems = filteredItems.filter { $0.gfcfStatus == self.gfcfStatus }
        }
        
        if self.scdStatus != .all {
            filteredItems = filteredItems.filter { $0.scdStatus == self.scdStatus }
        }
        
        if self.salicylateContent != .all {
            filteredItems = filteredItems.filter { $0.salicylateContent == self.salicylateContent }
        }
        
        if self.foodCategory != .all {
            filteredItems = filteredItems.filter { $0.category == self.foodCategory }
        }
        
        if !self.foodName.isEmpty {
            filteredItems = filteredItems.filter { $0.name.uppercased().contains(self.foodName.uppercased()) }
        }
        
        return filteredItems
    }
}
