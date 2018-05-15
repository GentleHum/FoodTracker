//
//  FoodsState.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/2/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

struct FoodsState: StateType {
    var foodItems: [FoodItem] = [FoodItem]()
    
    init() {
    }
}
