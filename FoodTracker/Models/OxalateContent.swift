//
//  OxalateContent.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/6/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

enum OxalateContent: String {
    case all = "all"
    case unknown = "unknown"
    case negligible = "negligible"
    case veryLow = "very low"
    case low = "low"
    case moderate = "moderate"
    case high = "high"
    case veryHigh = "very high"
    case varies = "varies"
    
    func description() -> String {
        return self.rawValue
    }
    
    func apply(to foodItems: [FoodItem]) -> [FoodItem] {
        return self.rawValue == OxalateContent.all.rawValue ? foodItems :
            foodItems.filter{ $0.oxalateContent.rawValue == self.rawValue }
    }
    
    func inList(_ oxalates: [OxalateContent]) -> Bool {
        for oxalate in oxalates {
            if self.rawValue == oxalate.rawValue {
                return true
            }
        }
        
        return false
    }
}
