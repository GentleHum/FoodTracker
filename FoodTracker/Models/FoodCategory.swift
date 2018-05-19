//
//  FoodCategory.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/2/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

enum FoodCategory: String {
    case all = "All"
    case alcohol = "Alcoholic Bev."
    case baking = "Baking Ingredient"
    case beverage = "Beverage"
    case dairy = "Dairy"
    case fat = "Fat"
    case fruit = "Fruit"
    case grain = "Grain/Grain Alt."
    case herbSpice = "Herb, Spice, Flavoring"
    case meat = "Meat"
    case nut = "Legume, Nut, Seed"
    case supplement = "Supplement"
    case sweetener = "Sweetener"
    case vegetable = "Vegetable"
    
    func description() -> String {
        return self.rawValue
    }
    
    func apply(to foodItems: [FoodItem]) -> [FoodItem] {
        return self.rawValue == FoodCategory.all.rawValue ? foodItems :
            foodItems.filter{ $0.category.rawValue == self.rawValue }
    }
}


