//
//  FoodCompoundSearchViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

final class FoodCompoundSearchViewController: FoodItemSearchViewController {
    private struct Storyboard {
        static let cellIdentifier = "FoodItemCell"
        static let title = "Foods"
        static let helpViewController = "HelpViewController"
        static let helpTitle = "Foods Help"
    }
    
    let oxalateValues: [OxalateContent] =
        [ .all, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh, .varies ]
    let salicylateValues: [SalicylateContent] =
        [ .all, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh, .varies ]
    let amineValues: [AmineContent] =
        [ .all, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh, .varies ]
    let categoryValues: [FoodCategory] =
        [.all, .vegetable, .grain, .meat, .fruit, .dairy, .beverage, .nut]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var oxalateContentControl: UISegmentedControl!
    @IBOutlet weak var amineControl: UISegmentedControl!
    @IBOutlet weak var salicylateContentControl: UISegmentedControl!
    @IBOutlet weak var categoryControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        searchCriteriaDidChange()
    }
    
    @IBAction func criteriaControlDidChange(_ sender: UISegmentedControl) {
        searchCriteriaDidChange()
    }
    
    @IBAction func helpButtonClicked(_ sender: UIBarButtonItem) {
        let helpViewController = showHelpViewController(forSender: sender, withIdentifier: Storyboard.helpViewController)
        helpViewController.title = Storyboard.helpTitle
    }
    
    override func dispatchSearchCriteriaActions() {
        let action = UpdateSearchCriteriaAction(oxalateContent: oxalateValues[oxalateContentControl.selectedSegmentIndex],
                                                salicylateContent: salicylateValues[salicylateContentControl.selectedSegmentIndex],
                                                amineContent: amineValues[amineControl.selectedSegmentIndex],
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
            if let foodItemCell = cell as? FoodItemTableViewCell {
                foodItemCell.configureCell(with: model)
            }
            
            return cell
        }
        
        tableView.dataSource = tableDataSource
        tableView.delegate = self
        tableView.tableFooterView = UIView()   // eliminate blank cells at bottom of table
        
        nameTextField.delegate = self
        
        self.title = Storyboard.title
    }
    
    // MARK: - StoreSubscriber
    override func newState(state: FoodsState) {
        super.newState(state: state)
        
        reloadAndScroll(tableView) 
    }
}
