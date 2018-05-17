//
//  SCDStatus.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/6/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

enum SCDStatus: String {
    case all = "All"
    case yes = "Yes"
    case no = "No"
    
    func description() -> String {
        return self.rawValue
    }
}
