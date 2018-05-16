//
//  SearchCriteriaReducer.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

fileprivate func apply(_ criteria: SearchCriteriaState, to foodItems: [FoodItem]) -> [FoodItem] {
    var filteredItems = foodItems
    
    if criteria.oxalateContent != .all {
        filteredItems = filteredItems.filter { $0.oxalateContent == criteria.oxalateContent }
    }

    if criteria.gfcfStatus != .all {
        filteredItems = filteredItems.filter { $0.gfcfStatus == criteria.gfcfStatus }
    }

    if criteria.scdStatus != .all {
        filteredItems = filteredItems.filter { $0.scdStatus == criteria.scdStatus }
    }
    
    if criteria.salicylateContent != .all {
        filteredItems = filteredItems.filter { $0.salicylateContent == criteria.salicylateContent }
    }
    
    if criteria.foodCategory != .all {
        filteredItems = filteredItems.filter { $0.category == criteria.foodCategory }
    }
    
    if !criteria.foodName.isEmpty {
        filteredItems = filteredItems.filter { $0.name.uppercased().contains(criteria.foodName.uppercased()) }
    }
    
    return filteredItems
}

func searchCriteriaReducer(action: Action, state: SearchCriteriaState?) -> SearchCriteriaState {
    var state = state ?? SearchCriteriaState()
    
    switch action {
    case let searchCriteriaAction as SearchCriteriaAction:
        state.oxalateContent = searchCriteriaAction.oxalateContent
        state.gfcfStatus = searchCriteriaAction.gfcfStatus
        state.scdStatus = searchCriteriaAction.scdStatus
        state.salicylateContent = searchCriteriaAction.salicylateContent
        state.foodCategory = searchCriteriaAction.foodCategory
        state.foodName = searchCriteriaAction.foodName
        state.matchingItems = apply(state, to: store.state.foodsState.foodItems)
    default: break
    }
    
    return state
}
