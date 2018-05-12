//
//  FoodsState.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/2/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

struct FoodsState: StateType {
    var foodItems: [FoodItem]
    
    init() {
        print("initializing FoodsState")  // zap
        foodItems = [
            FoodItem(name: "Acorn Squash", oxalateContent: .veryLow, gfcfStatus: .yes, scdStatus: .yes,
                     salicylateContent: .unknown, category: .vegetable),
            FoodItem(name: "Alfalfa Sprouts", oxalateContent: .low, gfcfStatus: .yes, scdStatus: .no,
                     salicylateContent: .unknown, category: .grain),
            FoodItem(name: "Allspice", oxalateContent: .unknown, gfcfStatus: .yes, scdStatus: .yes,
                     salicylateContent: .veryHigh, category: .herbSpice),
            FoodItem(name: "Almonds", oxalateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes,
                     salicylateContent: .veryHigh, category: .nut),
            FoodItem(name: "Aloe Vera Juice", oxalateContent: .veryLow, gfcfStatus: .yes, scdStatus: .no,
                     salicylateContent: .unknown, category: .supplement),
            FoodItem(name: "Amaranth", oxalateContent: .high, gfcfStatus: .yes, scdStatus: .no,
                     salicylateContent: .unknown, category: .grain),
            FoodItem(name: "Asiago cheese", oxalateContent: .unknown, gfcfStatus: .no, scdStatus: .no,
                     salicylateContent: .negligible, category: .dairy),
            FoodItem(name: "Beef", oxalateContent: .negligible, gfcfStatus: .yes, scdStatus: .yes,
                     salicylateContent: .negligible, category: .meat),
            FoodItem(name: "Blackberries", oxalateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes,
                     salicylateContent: .veryHigh, category: .fruit),
            FoodItem(name: "Blueberries", oxalateContent: .unknown, gfcfStatus: .yes, scdStatus: .yes,
                     salicylateContent: .veryHigh, category: .fruit),
            FoodItem(name: "Olives, Black", oxalateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes,
                     salicylateContent: .moderate, category: .vegetable),
        ]
    }
}
