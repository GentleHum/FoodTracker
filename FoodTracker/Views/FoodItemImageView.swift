//
//  FoodItemImageView.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/29/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import UIKit

@IBDesignable
class FoodItemImageView: UIImageView {

    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
}
