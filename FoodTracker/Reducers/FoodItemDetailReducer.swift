//
//  FoodItemDetailReducer.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/17/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

func foodItemDetailReducer(action: Action, state: FoodItemDetailState?) -> FoodItemDetailState {
    var state = state ?? FoodItemDetailState(foodItem: FoodItem())
    
    switch action {
    case let foodItemDetailAction as FoodItemDetailAction:
        state.foodItem = foodItemDetailAction.foodItem
    default: break
    }
    return state
}
