//
//  PaleoStatus.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/21/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

enum PaleoStatus: String {
    case all = "all"
    case yes = "yes"
    case no = "no"
    
    func description() -> String {
        return self.rawValue
    }
    
    func apply(to foodItems: [FoodItem]) -> [FoodItem] {
        return self.rawValue == PaleoStatus.all.rawValue ? foodItems :
            foodItems.filter{ $0.paleoStatus.rawValue == self.rawValue }
    }
}
