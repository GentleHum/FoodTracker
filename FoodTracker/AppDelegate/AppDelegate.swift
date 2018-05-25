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
var applicationFoodItemRealm = try! Realm()


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
        let libraryURL = try! Path.inLibrary("FoodItem.realm")
        let libraryConfiguration = Realm.Configuration(fileURL: libraryURL)

        applicationFoodItemRealm = try! Realm(configuration: libraryConfiguration)
        
        print("libraryURL: \(libraryURL)")  // zap
//        let fileURL = realm.configuration.fileURL ?? URL(fileURLWithPath: "file:///default.realm")
//        print("fileURL: \(fileURL)")  // zap
        
        guard applicationFoodItemRealm.isEmpty else { return }
        
        try! applicationFoodItemRealm.write {
            for foodItem in foodItems {
                applicationFoodItemRealm.add(foodItem)
            }
        }
    }
    
}




