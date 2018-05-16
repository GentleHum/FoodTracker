//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import UIKit
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
    FoodItem(name: "Acorn Squash", oxalateContent: .veryLow, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .unknown, category: .vegetable),
    FoodItem(name: "Alfalfa Sprouts", oxalateContent: .low, gfcfStatus: .yes, scdStatus: .no,
             salicylateContent: .unknown, category: .grain),
    FoodItem(name: "Allspice", oxalateContent: .unknown, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .veryHigh, category: .herbSpice),
    FoodItem(name: "Almonds", oxalateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .veryHigh, category: .nut),
    FoodItem(name: "Aloe Vera Juice", oxalateContent: .veryLow, gfcfStatus: .yes, scdStatus: .no,
             salicylateContent: .unknown, category: .supplement),
    FoodItem(name: "Amaranth", oxalateContent: .high, gfcfStatus: .yes, scdStatus: .no,
             salicylateContent: .unknown, category: .grain),
    FoodItem(name: "Anchovies", oxalateContent: .unknown, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .unknown, category: .meat),
    FoodItem(name: "Asiago cheese", oxalateContent: .unknown, gfcfStatus: .no, scdStatus: .no,
             salicylateContent: .negligible, category: .dairy),
    FoodItem(name: "Asparagus", oxalateContent: .low, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .moderate, category: .vegetable),
    FoodItem(name: "Beef", oxalateContent: .negligible, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .negligible, category: .meat),
    FoodItem(name: "Beets", oxalateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .moderate, category: .vegetable),
    FoodItem(name: "Blackberries", oxalateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .veryHigh, category: .fruit),
    FoodItem(name: "Blueberries", oxalateContent: .unknown, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .veryHigh, category: .fruit),
    FoodItem(name: "Olives, Black", oxalateContent: .veryHigh, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .moderate, category: .vegetable),
    FoodItem(name: "Bok Choy", oxalateContent: .veryLow, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .unknown, category: .vegetable),
    FoodItem(name: "Bourbon", oxalateContent: .unknown, gfcfStatus: .no, scdStatus: .yes,
             salicylateContent: .unknown, category: .alcohol),
    FoodItem(name: "Brandy", oxalateContent: .unknown, gfcfStatus: .yes, scdStatus: .no,
             salicylateContent: .high, category: .alcohol),
    FoodItem(name: "Brazil Nuts", oxalateContent: .unknown, gfcfStatus: .yes, scdStatus: .yes,
             salicylateContent: .high, category: .nut),
    FoodItem(name: "Brick cheese", oxalateContent: .unknown, gfcfStatus: .no, scdStatus: .yes,
             salicylateContent: .negligible, category: .dairy),
    FoodItem(name: "Brie cheese", oxalateContent: .unknown, gfcfStatus: .no, scdStatus: .yes,
             salicylateContent: .negligible, category: .dairy),
    
]

