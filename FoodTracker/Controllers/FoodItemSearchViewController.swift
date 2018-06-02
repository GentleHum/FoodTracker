//
//  FoodItemSearchViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/23/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import ReSwift

class FoodItemSearchViewController: UIViewController, StoreSubscriber, UITableViewDelegate,
                                    UITextFieldDelegate, UIPopoverPresentationControllerDelegate {
    let cellColors = [ .white, UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1) ]
    let categoryDisplayValues: [FoodCategory] =
        [.supplement, .vegetable, .grain, .meat, .fruit, .dairy, .beverage, .nut]

    var tableDataSource: TableDataSource<UITableViewCell, FoodItem>?
    var scrollToTop = false

    
    internal func getCategoryValues(from indexes: IndexSet) -> [FoodCategory] {
        return indexes.map { categoryDisplayValues[$0] }
    }

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
    
    func showHelpViewController(forSender sender: UIBarButtonItem, withIdentifier identifier: String) -> UIViewController {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier)
        viewController.modalPresentationStyle = .popover
        let popover: UIPopoverPresentationController = viewController.popoverPresentationController!
        popover.barButtonItem = sender
        popover.delegate = self
        self.present(viewController, animated: true, completion: nil)
        
        return viewController
    }
    
    func reloadAndScroll(_ tableView: UITableView) {
        tableView.reloadData()
        if scrollToTop {
            tableView.scrollToTop(ofSection: 0)
            scrollToTop = false
        }
    }

    // should be overridden
    func dispatchSearchCriteriaActions() {
    }
    
    func searchCriteriaDidChange() {
        scrollToTop = true
        dispatchSearchCriteriaActions()
    }

    
    // MARK: - Store Subscriber
    func newState(state: FoodsState) {
        tableDataSource?.models = state.matchingItems
    }
    
    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60.0)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = cellColors[indexPath.row % 2]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        store.dispatch(RoutingAction(destination: .foodItemDetail))
        if let foodItem = tableDataSource?.models[indexPath.row] {
            store.dispatch(SelectFoodItemAction(foodItem: foodItem))
        }
        
    }
    
    
    // MARK: - Text Field Delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: Popover Presentation Controller Delegate
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .fullScreen
    }
    
    func presentationController(_ controller: UIPresentationController,
                                viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController? {
        let navigationController = UINavigationController(rootViewController: controller.presentedViewController)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self,
                                         action: #selector(FoodItemSearchViewController.dismissViewController))
        doneButton.tintColor = .darkGray
        navigationController.topViewController?.navigationItem.rightBarButtonItem = doneButton
        return navigationController
    }
    
    @objc func dismissViewController() {
        self.dismiss(animated: true, completion: nil)
    }
}




