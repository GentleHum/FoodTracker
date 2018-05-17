//
//  FoodItemTableViewCell.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/16/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import UIKit

final class FoodItemTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var valuesLabel: UILabel!

    func configureCell(with foodItem: FoodItem) {
        self.nameLabel.text = foodItem.name
        self.categoryLabel.text = foodItem.category.description()
        
        self.valuesLabel.text =
            "Oxalate: \(foodItem.oxalateContent.description())" +
            ", GFCF: \(foodItem.gfcfStatus.description())" +
            ", SCD: \(foodItem.scdStatus.description())" +
            ", Salicylate: \(foodItem.salicylateContent.description())"
        
        self.valuesLabel.textAlignment = .left
    }
}
