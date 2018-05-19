//
//  SearchCriteriaReducer.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift


func searchCriteriaReducer(action: Action, state: SearchCriteriaState?) -> SearchCriteriaState {
    var state = state ?? SearchCriteriaState()
    
    switch action {
    case let searchCriteriaAction as UpdateSearchCriteriaAction:
        state.oxalateContent = searchCriteriaAction.oxalateContent
        state.gfcfStatus = searchCriteriaAction.gfcfStatus
        state.scdStatus = searchCriteriaAction.scdStatus
        state.salicylateContent = searchCriteriaAction.salicylateContent
        state.foodCategory = searchCriteriaAction.foodCategory
        state.foodName = searchCriteriaAction.foodName
    default: break
    }
    
    return state
}
