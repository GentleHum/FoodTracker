//
//  FoodCompoundSearchViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift
import MultiSelectSegmentedControl

final class FoodCompoundSearchViewController: FoodItemSearchViewController {
    private struct Storyboard {
        static let cellIdentifier = "FoodItemCell"
        static let title = "Foods"
        static let helpViewController = "HelpViewController"
        static let helpTitle = "Foods Help"
    }
    
    let oxalateDisplayValues: [OxalateContent] =
        [ .varies, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh ]
    let salicylateDisplayValues: [SalicylateContent] =
        [ .varies, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh ]
    let amineDisplayValues: [AmineContent] =
        [ .varies, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh ]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var oxalateContentControl: MultiSelectSegmentedControl!
    @IBOutlet weak var amineControl: MultiSelectSegmentedControl!
    @IBOutlet weak var salicylateContentControl: MultiSelectSegmentedControl!
    @IBOutlet weak var categoryControl: MultiSelectSegmentedControl!
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
    
    private func getOxalateValues(from indexes: IndexSet) -> [OxalateContent] {
        return indexes.map { oxalateDisplayValues[$0] }
    }

    private func getSalicylateValues(from indexes: IndexSet) -> [SalicylateContent] {
        return indexes.map { salicylateDisplayValues[$0] }
    }

    private func getAmineValues(from indexes: IndexSet) -> [AmineContent] {
        return indexes.map { amineDisplayValues[$0] }
    }

    override func dispatchSearchCriteriaActions() {
        let action =
            UpdateSearchCriteriaAction(
                oxalateContent: getOxalateValues(from: oxalateContentControl.selectedSegmentIndexes),
                salicylateContent: getSalicylateValues(from: salicylateContentControl.selectedSegmentIndexes),
                amineContent: getAmineValues(from: amineControl.selectedSegmentIndexes),
                foodCategory: getCategoryValues(from: categoryControl.selectedSegmentIndexes),
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
