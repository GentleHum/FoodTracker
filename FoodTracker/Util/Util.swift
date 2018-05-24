//
//  Util.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/23/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import Foundation

let categoryValues: [String: FoodCategory] = [
    "Alcoholic Beverage" : .alcohol,
    "Baking Ingredient" : .baking,
    "Beverage" : .beverage,
    "Condiment" : .condiment,
    "Dairy" : .dairy,
    "Fat" : .fat,
    "Fruit" : .fruit,
    "Grain" : .grain,
    "Herb, Spice, Flavoring" : .herbSpice,
    "HerbSpiceFlavoring" : .herbSpice,
    "Legume, Nut, Seed" : .nut,
    "LegumeNutSeed" : .nut,
    "Meat" : .meat,
    "Supplement" : .supplement,
    "Sweetener" : .sweetener,
    "Vegetable" : .vegetable,
]

let oxalateValues: [String: OxalateContent] = [
    "-" : .unknown,
    "Neg" : .negligible,
    "VL" : .veryLow,
    "L" : .low,
    "Mod" : .moderate,
    "M" : .moderate,
    "H" : .high,
    "VH" : .veryHigh,
    "Var" : .varies,
    "Varies" : .varies,
]

let salicylateValues: [String: SalicylateContent] = [
    "-" : .unknown,
    "Neg" : .negligible,
    "VL" : .veryLow,
    "L" : .low,
    "Mod" : .moderate,
    "M" : .moderate,
    "H" : .high,
    "VH" : .veryHigh,
    "Var" : .varies,
    "Varies" : .varies,
]

let amineValues: [String: AmineContent] = [
    "-" : .unknown,
    "Neg" : .negligible,
    "VL" : .veryLow,
    "L" : .low,
    "Mod" : .moderate,
    "M" : .moderate,
    "H" : .high,
    "VH" : .veryHigh,
    "Var" : .varies,
    "Varies" : .varies,
]

let gfcfValues: [String: GFCFStatus] = [
    "N" : .no,
    "Y" : .yes,
    "Y*" : .yes,
    "Y^" : .yes,
]

let scdValues: [String: SCDStatus] = [
    "N" : .no,
    "Y" : .yes,
    "Y*" : .yes,
    "Y^" : .yes,
]

let paleoValues: [String: PaleoStatus] = [
    "N" : .no,
    "Y" : .yes,
    "Y*" : .yes,
    "Y^" : .yes,
]

let fodmapValues: [String: FodmapStatus] = [
    "N" : .no,
    "Y" : .yes,
    "Y*" : .yes,
    "Y^" : .yes,
]


func loadFoodItemData() -> [FoodItem] {
    var foodItems = [FoodItem]()

    let parsedCSVRows = try! linesFromResource(fileName: "FoodTracker.csv")
    for row in parsedCSVRows {
        let foodItem = FoodItem(name: row[1],
                                category: categoryValues[row[0]] ?? .all,
                                oxalateContent: oxalateValues[row[2]] ?? .unknown,
                                salicylateContent: salicylateValues[row[5]] ?? .unknown,
                                amineContent: amineValues[row[8]] ?? .unknown,
                                gfcfStatus: gfcfValues[row[3]] ?? .yes,
                                scdStatus: scdValues[row[4]] ?? .yes,
                                paleoStatus: paleoValues[row[6]] ?? .yes,
                                fodmapStatus: fodmapValues[row[7]] ?? .yes)
        foodItems.append(foodItem)
    }
    
    return foodItems
}

func linesFromResource(fileName: String) throws -> [[String]] {
    guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else {
        throw NSError(domain: NSCocoaErrorDomain, code: NSFileNoSuchFileError, userInfo: [ NSFilePathErrorKey : fileName ])
    }

    let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
    
    return CSwiftV(with: content).rows
}
