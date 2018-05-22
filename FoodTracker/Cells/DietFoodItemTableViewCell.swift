//
//  DietFoodItemTableViewCell.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/21/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import Foundation

final class DietFoodItemTableViewCell: FoodItemTableViewCell {
    override func getValuesLabel(with foodItem: FoodItem) -> String {
        return "GFCF: \(foodItem.gfcfStatus.description())" +
            ", SCD: \(foodItem.scdStatus.description())" +
            ", Paleo: \(foodItem.paleoStatus.description())" +
            ", Fodmap: \(foodItem.fodmapStatus.description())"
    }
}
