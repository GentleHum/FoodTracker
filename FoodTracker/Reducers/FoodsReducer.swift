//
//  FoodsReducer.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/2/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

func foodsReducer(action: Action, state: FoodsState?) -> FoodsState {
    var state = state ?? FoodsState()
    state.foodItems = FoodItem.allAsArray()
    return state
}
