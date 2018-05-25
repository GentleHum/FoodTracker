//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift
import RealmSwift

var store = Store<AppState>(reducer: appReducer, state: nil)


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appRouter: AppRouter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.makeKeyAndVisible()
        
        initializeRealm(foodItems: loadFoodItemData())

        appRouter = AppRouter(window: window)
        
        return true
    }
    
    private func initializeRealm(foodItems: [FoodItem]) {
        let realm = try! Realm()
        let fileURL = realm.configuration.fileURL ?? URL(fileURLWithPath: "file:///default.realm")
        print("fileURL: \(fileURL)")  // zap
        
        guard realm.isEmpty else { return }
        
        try! realm.write {
            for foodItem in foodItems {
                realm.add(foodItem)
            }
        }
    }
    
}




