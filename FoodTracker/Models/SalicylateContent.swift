//
//  SalicylateContent.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/6/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

enum SalicylateContent: String {
    case all = "All"
    case unknown = "-"
    case negligible = "Negligible"
    case veryLow = "VL"
    case low = "L"
    case moderate = "Mod"
    case high = "H"
    case veryHigh = "VH"
    case varies = "Var"
    
    func description() -> String {
        return self.rawValue
    }
}
