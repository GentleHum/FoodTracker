//
//  SCDStatus.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/6/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

enum SCDStatus: String {
    case all = "all"
    case yes = "yes"
    case no = "no"
    
    func description() -> String {
        return self.rawValue
    }
    
    func apply(to foodItems: [FoodItem]) -> [FoodItem] {
        return self.rawValue == SCDStatus.all.rawValue ? foodItems :
            foodItems.filter{ $0.scdStatus.rawValue == self.rawValue }
    }
}



