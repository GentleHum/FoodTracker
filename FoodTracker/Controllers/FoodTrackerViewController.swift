//
//  FoodTrackerViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 4/30/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

final class FoodTrackerViewController: UIViewController {
    private struct Storyboard {
        static let cellIdentifier = "FoodItemCell"
        static let title = "Restore Health Now"
    }
    
    let cellColors = [ .white, UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1) ]
    
    let oxalateValues: [OxalateContent] =
        [ .all, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh, .varies ]
    let gfcfValues: [GFCFStatus] = [ .all, .yes, .no ]
    let scdValues: [SCDStatus] = [ .all, .yes, .no ]
    let salicylateValues: [SalicylateContent] =
        [ .all, .unknown, .negligible, .veryLow, .low, .moderate, .high, .veryHigh, .varies ]
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
        
        store.dispatch(RoutingAction(destination: .main))
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
        
        tableDataSource = TableDataSource(cellIdentifier: Storyboard.cellIdentifier, models: []) {cell, model in
            
            if let foodItemCell = cell as? FoodItemTableViewCell {
                foodItemCell.configureCell(with: model)
            }
            
            return cell
        }
        
        tableView.dataSource = tableDataSource
        tableView.tableFooterView = UIView()   // eliminate blank cells at bottom of table
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        self.title = Storyboard.title
        
    }

}

// MARK: - StoreSubscriber
extension FoodTrackerViewController: StoreSubscriber {
    func newState(state: SearchCriteriaState) {
        tableDataSource?.models = state.matchingItems
        tableView.reloadData()
        
        // scroll to top AFTER table is reloaded (only if table is not empty)
        DispatchQueue.main.async {
            if self.tableView.numberOfRows(inSection: 0) > 0 {
                self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0),
                                           at: .top, animated: true)
            }
        }
    }
}

// MARK: - Table View Delegate
extension FoodTrackerViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60.0)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = cellColors[indexPath.row % 2]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row: \(indexPath.row)")  // zap
        store.dispatch(RoutingAction(destination: .foodItemDetail))
        if let foodItem = tableDataSource?.models[indexPath.row] {
            store.dispatch(FoodItemDetailAction(foodItem: foodItem))
        }

    }
}

