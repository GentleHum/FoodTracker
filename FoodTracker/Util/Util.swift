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

enum CSVFields: Int {
    case category = 0
    case name = 1
    case oxalateContent = 2
    case gfcfStatus = 3
    case scdStatus = 4
    case salicylateContent = 5
    case paleoStatus = 6
    case fodmapStatus = 7
    case amineContent = 8
}

func loadFoodItemData() -> [FoodItem] {
    let parsedCSVRows = try! linesFromResource(fileName: "FoodTracker.csv")
    
    return parsedCSVRows.map { row in
        FoodItem(name: row[CSVFields.name.rawValue],
                 category: categoryValues[row[CSVFields.category.rawValue]] ?? .all,
                 oxalateContent: oxalateValues[row[CSVFields.oxalateContent.rawValue]] ?? .unknown,
                 salicylateContent: salicylateValues[row[CSVFields.salicylateContent.rawValue]] ?? .unknown,
                 amineContent: amineValues[row[CSVFields.amineContent.rawValue]] ?? .unknown,
                 gfcfStatus: gfcfValues[row[CSVFields.gfcfStatus.rawValue]] ?? .yes,
                 scdStatus: scdValues[row[CSVFields.scdStatus.rawValue]] ?? .yes,
                 paleoStatus: paleoValues[row[CSVFields.paleoStatus.rawValue]] ?? .yes,
                 fodmapStatus: fodmapValues[row[CSVFields.fodmapStatus.rawValue]] ?? .yes) }
}

func linesFromResource(fileName: String) throws -> [[String]] {
    guard let path = Bundle.main.path(forResource: fileName, ofType: nil) else {
        throw NSError(domain: NSCocoaErrorDomain, code: NSFileNoSuchFileError, userInfo: [ NSFilePathErrorKey : fileName ])
    }

    let content = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
    
    return CSwiftV(with: content).rows
}
