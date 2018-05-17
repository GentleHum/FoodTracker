//
//  GFCFStatus.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/4/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

enum GFCFStatus: String {
    case all = "All"
    case yes = "Yes"
    case no = "No"
    
    func description() -> String {
        return self.rawValue
    }
}
