//
//  AppRouter.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

enum RoutingDestination: String {
    case main = "MainTabBarViewController"
    case foods = "FoodTrackerViewController"
    case diets = "DietTrackerViewController"
    case foodItemDetail = "FoodItemDetailViewController"
}

final class AppRouter {
    private struct Storyboard {
        static let rootController = "MainTabBarViewController"
        static let title = "Restore Health Now"
        static let name = "Main"
    }
    
    let storyboard: UIStoryboard
    let rootViewController: UITabBarController
    
    init(window: UIWindow) {
        storyboard = UIStoryboard(name: Storyboard.name, bundle: nil)
        rootViewController =
            storyboard.instantiateViewController(withIdentifier: Storyboard.rootController) as! UITabBarController

        window.rootViewController = rootViewController
        
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }
    }
    
    fileprivate func pushViewController(identifier: String, animated: Bool) {
        let selectedIndex = rootViewController.selectedIndex
        if let navigationController = rootViewController.viewControllers?[selectedIndex] as? UINavigationController {
            let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
            let newViewControllerType = type(of: viewController)
            if let currentVc = navigationController.topViewController {
                let currentViewControllerType = type(of: currentVc)
                if currentViewControllerType == newViewControllerType {
                    return
                }
            }
            print("pushing view controller")  // zap
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
}

extension AppRouter: StoreSubscriber {
    func newState(state: RoutingState) {
        
        // currently, routing is happening via the tab bar controller and the navigation controllers within each tab.
        // this may change in the future.
        
        print("AppRouter: newState: \(state.navigationState.rawValue)")  // zap
        switch state.navigationState {
        default:
            break
        }
    }
}
