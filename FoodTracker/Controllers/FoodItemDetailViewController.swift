//
//  FoodItemDetailViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/17/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

final class FoodItemDetailViewController: UIViewController {
    private struct Storyboard {
        static let cellIdentifier = "FoodItemDetailCell"
        static let title = "RHN"
    }
    
    private static let defaultCategoryImageName = "vegetables.jpg"
    private static let categoryImages: [FoodCategory: String] = [
        .meat : "meats.jpg",
        .vegetable : "vegetables.jpg",
        .grain : "grains.jpg",
        .nut : "nuts.jpg",
        .fruit : "fruits.jpg",
        .beverage: "beverages.jpg",
        .dairy : "dairy.jpg",
        .alcohol : "alcohol.jpg",
        .baking : "baking.jpg",
        .condiment : "condiments.jpg",
        .fat : "fats.jpg",
        .herbSpice : "herbs.jpg",
        .supplement : "supplements.jpg",
        .sweetener : "sweeteners.jpg",
    ]
    
    private static func getCategoryImage(forCategory category: FoodCategory) -> UIImage? {
        let imageName = categoryImages[category] ?? defaultCategoryImageName
        return UIImage(named: imageName)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var oxalateValueLabel: UILabel!
    @IBOutlet weak var salicylateValueLabel: UILabel!
    @IBOutlet weak var amineValueLabel: UILabel!
    @IBOutlet weak var gfcfValueLabel: UILabel!
    @IBOutlet weak var scdValueLabel: UILabel!
    @IBOutlet weak var paleoValueLabel: UILabel!
    @IBOutlet weak var fodmapValueLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self) {
            $0.select {
                $0.foodsState
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = Storyboard.title
    }
    
}

// MARK: - StoreSubscriber
extension FoodItemDetailViewController: StoreSubscriber {
    func newState(state: FoodsState) {
        print("+++++++++++FoodItemDetailViewController: newState")  // zap
        nameLabel.text = state.selectedItem.name
        categoryImageView.image =
            FoodItemDetailViewController.getCategoryImage(forCategory: state.selectedItem.category)
        categoryLabel.text = state.selectedItem.category.description()
        oxalateValueLabel.text = "Oxalate: " + state.selectedItem.oxalateContent.description()
        salicylateValueLabel.text = "Salicylate: " + state.selectedItem.salicylateContent.description()
        amineValueLabel.text = "Amine: " + state.selectedItem.amineContent.description()
        gfcfValueLabel.text = "GFCF: " + state.selectedItem.gfcfStatus.description()
        scdValueLabel.text = "SCD: " + state.selectedItem.scdStatus.description()
        paleoValueLabel.text = "Paleo: " + state.selectedItem.paleoStatus.description()
        fodmapValueLabel.text = "Fodmap: " + state.selectedItem.fodmapStatus.description()
        
        self.title = nameLabel.text

    }
}



// MARK: - Table View Delegate
extension FoodItemDetailViewController: UITableViewDelegate {

}

