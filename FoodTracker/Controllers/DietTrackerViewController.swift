//
//  DietTrackerViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/20/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

final class DietTrackerViewController: FoodItemSearchViewController {
    private struct Storyboard {
        static let cellIdentifier = "DietFoodItemCell"
        static let title = "Diets"
    }
    
    let gfcfValues: [GFCFStatus] = [ .all, .yes, .no ]
    let scdValues: [SCDStatus] = [ .all, .yes, .no ]
    let paleoValues: [PaleoStatus] = [ .all, .yes, .no ]
    let fodmapValues: [FodmapStatus] = [ .all, .yes, .no ]
    let categoryValues: [FoodCategory] =
        [.all, .vegetable, .grain, .meat, .fruit, .dairy, .beverage, .nut]
    
    // MARK: - outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var gfcfControl: UISegmentedControl!
    @IBOutlet weak var scdControl: UISegmentedControl!
    @IBOutlet weak var paleoControl: UISegmentedControl!
    @IBOutlet weak var fodmapControl: UISegmentedControl!
    @IBOutlet weak var categoryControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        dispatchSearchCriteriaActions()
    }
    
    @IBAction func criteriaControlDidChange(_ sender: UISegmentedControl) {
        dispatchSearchCriteriaActions()
    }
    
    private func dispatchSearchCriteriaActions() {
        let action = UpdateSearchCriteriaAction(gfcfStatus: gfcfValues[gfcfControl.selectedSegmentIndex],
                                                scdStatus: scdValues[scdControl.selectedSegmentIndex],
                                                paleoStatus: paleoValues[paleoControl.selectedSegmentIndex],
                                                fodmapStatus: fodmapValues[fodmapControl.selectedSegmentIndex],
                                                foodCategory: categoryValues[categoryControl.selectedSegmentIndex],
                                                foodName: nameTextField.text ?? "")
        store.dispatch(action)
        store.dispatch(applySearchCriteria)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dispatchSearchCriteriaActions()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDataSource = TableDataSource(cellIdentifier: Storyboard.cellIdentifier, models: []) {cell, model in
            if let foodItemCell = cell as? DietFoodItemTableViewCell {
                foodItemCell.configureCell(with: model)
            }
            
            return cell
        }
        
        tableView.dataSource = tableDataSource
        tableView.delegate = self
        tableView.tableFooterView = UIView()   // eliminate blank cells at bottom of table
        
        self.title = Storyboard.title
    }
    
    // MARK: - StoreSubscriber
    override func newState(state: FoodsState) {
        super.newState(state: state)
        
        tableView.reloadData()
        
        // scroll to top AFTER table is reloaded
        tableView.scrollToTop(ofSection: 0)
    }
}



