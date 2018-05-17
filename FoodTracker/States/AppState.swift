//
//  AppState.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    let routingState: RoutingState
    let foodsState: FoodsState
    let searchCriteriaState: SearchCriteriaState
    let foodItemDetailState: FoodItemDetailState
}

