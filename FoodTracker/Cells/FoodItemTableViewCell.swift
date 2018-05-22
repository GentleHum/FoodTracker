//
//  FoodItemTableViewCell.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/16/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import UIKit

class FoodItemTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var valuesLabel: UILabel!

    
    func getValuesLabel(with foodItem: FoodItem) -> String {
        return "Oxalate: \(foodItem.oxalateContent.description())" +
                ", Salicylate: \(foodItem.salicylateContent.description())" +
                ", Amine: \(foodItem.amineContent.description())"
    }
    
    func configureCell(with foodItem: FoodItem) {
        self.nameLabel.text = foodItem.name
        self.categoryLabel.text = foodItem.category.description()
        
        self.valuesLabel.text = getValuesLabel(with: foodItem)
        self.valuesLabel.textAlignment = .left
    }
}



