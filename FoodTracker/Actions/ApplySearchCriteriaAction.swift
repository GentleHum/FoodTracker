//
//  ApplySearchCriteriaAction.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/19/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

struct ApplySearchCriteriaAction: Action {
    var searchCriteria: SearchCriteriaState
}

func applySearchCriteria(state: AppState, store: Store<AppState>) -> ApplySearchCriteriaAction {
    return ApplySearchCriteriaAction(searchCriteria: state.searchCriteriaState)
}

