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
    
    state.foodItems = FoodItem.allAsArray(in: foodItemRealm)
    
    switch action {
    case let selectItemAction as SelectFoodItemAction:
        state.selectedItem = selectItemAction.foodItem
        
    case let applyAction as ApplySearchCriteriaAction:
        state.matchingItems = applyAction.searchCriteria.apply(to: state.foodItems)
    default: break
    }
    
    return state
}
