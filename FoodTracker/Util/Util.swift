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
    "Dairy" : .dairy,
    "Fat" : .fat,
    "Fruit" : .fruit,
    "Grain" : .grain,
    "Herb, Spice, Flavoring" : .herbSpice,
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


let fileContent =
"Dairy,Blue Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Brick Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Brie Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Camembert Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Cheddar Cheese,VL,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Chevre,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Colby Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Cottage Cheese,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Cream,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Cream Cheese,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Dry Curd Cottage Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Edam Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Feta Cheese,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Ghee,VL,Y,Y,Neg,Y,Y,Neg\n" +
"Dairy,Gjetost Cheese,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Gorgonzola Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Gouda Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Gruyere Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Havarti Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Kefir,-,N,Y*,Neg,N,Y*,Neg\n" +
"Dairy,Limburger Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Manchego Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Monterey Jack Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Mozzerella Cheese,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Muenster Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Neufchatel Cheese,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Parmesan Cheese,L,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Port du Salut Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Primost Cheese,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Provalone Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Ricotta Cheese,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Romano Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Roquefort Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Sour Cream,-,N,N,Neg,N,N,Neg\n" +
"Dairy,Stilton Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Swiss Cheese,-,N,Y,Neg,N,Y,Neg\n" +
"Dairy,Yogurt (commercial),VL,N,N,Neg,N,N,Neg\n" +
"Dairy,Yogurt (homemade),-,N,Y,Neg,N,Y,Neg\n" +
    "Beverage,Apple Cider,-,Y,Y,-\n" +
    "Beverage,Apple Juice,VL,Y,N,M\n" +
    "Beverage,Buttermilk,VL,N,N,Neg\n" +
    "Beverage,Cherry Juice,L,Y,Y*,-\n" +
    "Beverage,Chocolate Milk,H,N,N,Neg\n" +
    "Beverage,Club Soda,-,Y,Y,-\n" +
    "Beverage,Coconut Milk,-,Y,Y*,-\n" +
    "Beverage,Coffee,VL,Y,Y,Varies\n" +
    "Beverage,Coffee (Instant),VL,Y,N,Varies,Y,N,Varies\n" +
    "Beverage,Cranberry Juice,VL,Y,Y*,VH\n" +
    "Beverage,Decaffeinated Products,Varies,Y^,N,Varies\n" +
    "Beverage,Grape Juice-Purple,-,Y,Y,H\n" +
    "Beverage,Grape Juice-Red,M,Y,Y,H\n" +
    "Beverage,Grape Juice-White,L,Y,Y,M\n" +
    "Beverage,Grapefruit Juice,VL,Y,Y*,H\n" +
    "Beverage,Juice from Concentrate,Varies,Y,N,Varies\n" +
    "Beverage,Milk,VL,N,N,Neg\n" +
    "Beverage,Orange Juice-Fresh,VL,Y,Y,M\n" +
    "Beverage,Orange Juice-Frozen,VL,Y,N,M\n" +
    "Beverage,Peppermint Tea,VL,Y,Y,VH\n" +
    "Beverage,Pineapple Juice,VL,Y,Y*,M\n" +
    "Beverage,Rice Milk-Carob,VH,Y^,N,-\n" +
    "Beverage,Rice Milk-Vanilla,VH,Y^,N,-\n" +
    "Beverage,Soybean Milk,VH,Y,N,Neg\n" +
    "Beverage,Spearmint Tea,VL,Y,Y,VH\n" +
    "Beverage,Tomato Juice (Canned),M,Y,Y*,M\n" +
    "Beverage,V8 Juice,H,Y,N,VH,Y,N,VH\n" +
    "Vegetable,Spinach-Fresh,VH,Y,Y,H\n" +
    "Vegetable,Spinach-Frozen,VH,Y,Y,M\n" +
    "Vegetable,String Beans,M,Y,Y,L\n" +
    "Vegetable,Sweet Potatoes,VH,Y,N,H\n" +
    "Vegetable,Taro,-,Y,N,-\n" +
    "Vegetable,Tomato Paste-Canned,H,Y,N,VH\n" +
    "Vegetable,Tomato Puree-Canned,H,Y,N,VH\n" +
    "Vegetable,Tomato Sauce-Canned,H,Y,N,VH\n" +
    "Vegetable,Tomatoes-Fresh,M,Y,Y,M\n" +
    "Vegetable,Turnips,VL,Y,N,Neg\n"


func loadFoodItemData() -> [FoodItem] {
    var foodItems = [FoodItem]()
    let parsedCSV: [[String]] = fileContent.components(separatedBy: "\n").map{ $0.components(separatedBy: ",") }
    
    for row in parsedCSV {
        if row.count > 1 {
            let category = categoryValues[row[0]] ?? .all
            let name = row[1]
            let oxalateContent = oxalateValues[row[2]] ?? .unknown
            let gfcfStatus = gfcfValues[row[3]] ?? .yes
            let scdStatus = scdValues[row[4]] ?? .yes
            let salicylateContent = salicylateValues[row[5]] ?? .unknown
            var paleoStatus = PaleoStatus.yes
            var fodmapStatus = FodmapStatus.yes
            var amineContent = AmineContent.unknown
            
            if row.count > 6 {
                paleoStatus = paleoValues[row[6]] ?? .yes
            }
            
            if row.count > 7 {
                fodmapStatus = fodmapValues[row[7]] ?? .yes
            }
            
            if row.count > 8 {
                amineContent = amineValues[row[8]] ?? .unknown
            }

            let foodItem = FoodItem(name: name,
                                    category: category,
                                    oxalateContent: oxalateContent,
                                    salicylateContent: salicylateContent,
                                    amineContent: amineContent,
                                    gfcfStatus: gfcfStatus,
                                    scdStatus: scdStatus,
                                    paleoStatus: paleoStatus,
                                    fodmapStatus: fodmapStatus)
            foodItems.append(foodItem)
        }
    }
    
    return foodItems
}
