//
//  MainTabBarViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/20/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    private struct Storyboard {
        static let cellIdentifier = "FoodItemCell"
        static let title = "Restore Health Now"
    }
    
    private let routingDestinations: [String: RoutingDestination] = [
        "Diets" : .diets,
        "Foods" : .foods
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Storyboard.title
    }
    
    // UITabBarDelegate
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let title = item.title ?? ""
        if let routingDestination = routingDestinations[title] {
            store.dispatch(RoutingAction(destination: routingDestination))
        }
    }


}
