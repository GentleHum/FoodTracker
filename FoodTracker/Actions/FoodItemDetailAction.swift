//
//  FoodItemDetailAction.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/17/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

struct FoodItemDetailAction: Action {
    let foodItem: FoodItem
    
    init(foodItem: FoodItem) {
        self.foodItem = foodItem
    }
}
