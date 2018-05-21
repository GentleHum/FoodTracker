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
        state.foodName = searchCriteriaAction.foodName
        state.foodCategory = searchCriteriaAction.foodCategory
        state.oxalateContent = searchCriteriaAction.oxalateContent
        state.salicylateContent = searchCriteriaAction.salicylateContent
        state.amineContent = searchCriteriaAction.amineContent
        state.gfcfStatus = searchCriteriaAction.gfcfStatus
        state.scdStatus = searchCriteriaAction.scdStatus
        state.paleoStatus = searchCriteriaAction.paleoStatus
        state.fodmapStatus = searchCriteriaAction.fodmapStatus
    default: break
    }
    
    return state
}
