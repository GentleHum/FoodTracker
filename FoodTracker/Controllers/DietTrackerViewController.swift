//
//  DietTrackerViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/20/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

final class DietTrackerViewController: UIViewController {
    private struct Storyboard {
        static let cellIdentifier = "FoodItemCell"
        static let title = "Diets"
    }
    
    let cellColors = [ .white, UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1) ]
    
    let gfcfValues: [GFCFStatus] = [ .all, .yes, .no ]
    let scdValues: [SCDStatus] = [ .all, .yes, .no ]
    let paleoValues: [PaleoStatus] = [ .all, .yes, .no ]
    let fodmapValues: [FodmapStatus] = [ .all, .yes, .no ]
    let categoryValues: [FoodCategory] =
        [.all, .vegetable, .grain, .meat, .fruit, .dairy, .alcohol, .nut]
    
    var tableDataSource: TableDataSource<UITableViewCell, FoodItem>?
    
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
        store.subscribe(self) {
            $0.select {
                $0.foodsState
            }
        }
        
        dispatchSearchCriteriaActions()
        
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
                foodItemCell.configureCell(with: model, forType: .diets)
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
extension DietTrackerViewController: StoreSubscriber {
    func newState(state: FoodsState) {
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
extension DietTrackerViewController: UITableViewDelegate {
    
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
            store.dispatch(SelectFoodItemAction(foodItem: foodItem))
        }
        
    }
}

