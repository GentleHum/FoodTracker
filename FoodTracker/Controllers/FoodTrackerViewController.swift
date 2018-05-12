//
//  FoodTrackerViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

final class FoodTrackerViewController: UIViewController {
    
    let oxalateValues: [OxalateContent] = [ .all, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh, .varies ]
    let gfcfValues: [GFCFStatus] = [ .all, .yes, .no, .checkDiet ]
    let scdValues: [SCDStatus] = [ .all, .yes, .no, .checkDiet ]
    let salicylateValues: [SalicylateContent] = [ .all, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh, .varies ]
    let categoryValues: [FoodCategory] =
        [.all, .vegetable, .grain, .meat, .fruit, .dairy, .alcohol, .nut]

    var tableDataSource: TableDataSource<UITableViewCell, FoodItem>?

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var oxalateContentControl: UISegmentedControl!
    @IBOutlet weak var gfcfControl: UISegmentedControl!
    @IBOutlet weak var scdControl: UISegmentedControl!
    @IBOutlet weak var salicylateContentControl: UISegmentedControl!
    @IBOutlet weak var categoryControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        dispatchSearchCriteriaAction()
    }
    
    @IBAction func criteriaControlDidChange(_ sender: UISegmentedControl) {
        dispatchSearchCriteriaAction()
    }
    
    private func dispatchSearchCriteriaAction() {
        let action = SearchCriteriaAction(oxalateContent: oxalateValues[oxalateContentControl.selectedSegmentIndex],
                                          gfcfStatus: gfcfValues[gfcfControl.selectedSegmentIndex],
                                          scdStatus: scdValues[scdControl.selectedSegmentIndex],
                                          salicylateContent: salicylateValues[salicylateContentControl.selectedSegmentIndex],
                                          foodCategory: categoryValues[categoryControl.selectedSegmentIndex],
                                          foodName: nameTextField.text ?? "")
        store.dispatch(action)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self) {
            $0.select {
                $0.searchCriteriaState
            }
        }
        
        store.dispatch(SearchCriteriaAction())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        
        tableDataSource = TableDataSource(cellIdentifier:"FoodItemCell", models: []) {cell, model in
            cell.textLabel?.text = model.name
            cell.textLabel?.textAlignment = .center
            return cell
        }
        
        tableView.dataSource = tableDataSource
        
    }

}

// MARK: - StoreSubscriber
extension FoodTrackerViewController: StoreSubscriber {
    func newState(state: SearchCriteriaState) {
        tableDataSource?.models = state.matchingItems
        tableView.reloadData()
    }
}

// MARK: - Table View Delegate
extension FoodTrackerViewController: UITableViewDelegate {
}

