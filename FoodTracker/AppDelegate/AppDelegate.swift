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
        
        initializeRealm()

        appRouter = AppRouter(window: window)
        
        
        return true
    }
    
    private func initializeRealm() {
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


// MARK: - Test data
var foodItems: [FoodItem] = [
    FoodItem(name: "Acorn Squash", category: .vegetable, oxalateContent: .veryLow, salicylateContent: .unknown, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Alfalfa Sprouts", category: .grain, oxalateContent: .low, salicylateContent: .unknown, gfcfStatus: .yes, scdStatus: .no),
    FoodItem(name: "Allspice", category: .herbSpice, oxalateContent: .unknown, salicylateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Almonds", category: .nut, oxalateContent: .veryHigh, salicylateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Aloe Vera Juice", category: .supplement, oxalateContent: .veryLow, salicylateContent: .unknown, gfcfStatus: .yes, scdStatus: .no),
    FoodItem(name: "Amaranth", category: .grain, oxalateContent: .high, salicylateContent: .unknown, gfcfStatus: .yes, scdStatus: .no),
    FoodItem(name: "Anchovies", category: .meat, oxalateContent: .unknown, salicylateContent: .unknown, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Asiago cheese", category: .dairy, oxalateContent: .unknown, salicylateContent: .negligible, gfcfStatus: .no, scdStatus: .no),
    FoodItem(name: "Asparagus", category: .vegetable, oxalateContent: .low, salicylateContent: .moderate, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Bananas", category: .fruit, oxalateContent: .moderate, salicylateContent: .negligible, amineContent: .high, gfcfStatus: .yes, scdStatus: .yes, paleoStatus: .yes, fodmapStatus: .yes),
    FoodItem(name: "Beef", category: .meat, oxalateContent: .negligible, salicylateContent: .negligible, gfcfStatus: .yes, scdStatus: .yes, paleoStatus: .no, fodmapStatus: .yes),
    FoodItem(name: "Beets", category: .vegetable, oxalateContent: .veryHigh, salicylateContent: .moderate, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Blackberries", category: .fruit, oxalateContent: .veryHigh, salicylateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Blueberries", category: .fruit, oxalateContent: .unknown, salicylateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Olives, Black", category: .vegetable, oxalateContent: .veryHigh, salicylateContent: .moderate, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Bok Choy", category: .vegetable, oxalateContent: .veryLow, salicylateContent: .unknown, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Bourbon", category: .alcohol, oxalateContent: .unknown, salicylateContent: .unknown, gfcfStatus: .no, scdStatus: .yes),
    FoodItem(name: "Brandy", category: .alcohol, oxalateContent: .unknown, salicylateContent: .high, gfcfStatus: .yes, scdStatus: .no),
    FoodItem(name: "Brazil Nuts", category: .nut, oxalateContent: .unknown, salicylateContent: .high, gfcfStatus: .yes, scdStatus: .yes),
    FoodItem(name: "Brick cheese", category: .dairy, oxalateContent: .unknown, salicylateContent: .negligible, gfcfStatus: .no, scdStatus: .yes),
    FoodItem(name: "Brie cheese", category: .dairy, oxalateContent: .unknown, salicylateContent: .negligible, gfcfStatus: .no, scdStatus: .yes),
]

