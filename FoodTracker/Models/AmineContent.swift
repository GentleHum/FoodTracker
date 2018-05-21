//
//  AmineContent.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/21/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

enum AmineContent: String {
    case all = "All"
    case unknown = "-"
    case negligible = "Negligible"
    case veryLow = "VL"
    case low = "L"
    case moderate = "Mod"
    case high = "H"
    case veryHigh = "VH"
    case varies = "Var"
    
    func description() -> String {
        return self.rawValue
    }
    
    func apply(to foodItems: [FoodItem]) -> [FoodItem] {
        return self.rawValue == AmineContent.all.rawValue ? foodItems :
            foodItems.filter{ $0.amineContent.rawValue == self.rawValue }
    }
}
