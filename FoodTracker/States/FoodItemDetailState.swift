//
//  FoodItemDetailState.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/17/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

struct FoodItemDetailState: StateType {
    var foodItem: FoodItem

    init(foodItem: FoodItem) {
        self.foodItem = foodItem
    }
}
