//
//  AppReducer.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(
        routingState: routingReducer(action: action, state: state?.routingState),
        foodsState: foodsReducer(action: action, state: state?.foodsState),
        searchCriteriaState: searchCriteriaReducer(action: action, state: state?.searchCriteriaState),
        foodItemDetailState: foodItemDetailReducer(action: action, state: state?.foodItemDetailState))
}

