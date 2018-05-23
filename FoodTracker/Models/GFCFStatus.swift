//
//  GFCFStatus.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/4/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

enum GFCFStatus: String {
    case all = "all"
    case yes = "yes"
    case no = "no"
    
    func description() -> String {
        return self.rawValue
    }
    
    func apply(to foodItems: [FoodItem]) -> [FoodItem] {
        return self.rawValue == GFCFStatus.all.rawValue ? foodItems :
            foodItems.filter{ $0.gfcfStatus.rawValue == self.rawValue }
    }
}
