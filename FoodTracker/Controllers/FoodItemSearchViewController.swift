//
//  FoodItemSearchViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/23/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

class FoodItemSearchViewController: UIViewController, StoreSubscriber {
    let cellColors = [ .white, UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1) ]
    
    var tableDataSource: TableDataSource<UITableViewCell, FoodItem>?

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
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func newState(state: FoodsState) {
        tableDataSource?.models = state.matchingItems
    }
}


// MARK: - Table View Delegate
extension FoodItemSearchViewController: UITableViewDelegate {
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
