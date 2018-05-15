//
//  Persistor.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/14/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import Foundation

protocol Persistor {
    func load()
    func save()
}
