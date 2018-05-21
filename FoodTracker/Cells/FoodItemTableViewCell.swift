//
//  FoodItemTableViewCell.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/16/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import UIKit

enum FoodItemCellType {
    case unspecified, foods, diets
}


final class FoodItemTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var valuesLabel: UILabel!

    func configureCell(with foodItem: FoodItem, forType cellType: FoodItemCellType = .foods) {
        self.nameLabel.text = foodItem.name
        self.categoryLabel.text = foodItem.category.description()
        
        switch cellType {
        case .foods:
            self.valuesLabel.text =
                "Oxalate: \(foodItem.oxalateContent.description())" +
                ", Salicylate: \(foodItem.salicylateContent.description())" +
                ", Amine: \(foodItem.amineContent.description())"

        case .diets:
            self.valuesLabel.text =
                "GFCF: \(foodItem.gfcfStatus.description())" +
                ", SCD: \(foodItem.scdStatus.description())" +
                ", Paleo: \(foodItem.paleoStatus.description())" +
                ", Fodmap: \(foodItem.fodmapStatus.description())" 
            
        default: break
        }
        
        self.valuesLabel.textAlignment = .left
    }
}
