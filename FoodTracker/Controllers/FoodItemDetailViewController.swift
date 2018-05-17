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
        static let title = "Restore Health Now"
    }
    
    @IBOutlet weak var nameLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self) {
            $0.select {
                $0.foodItemDetailState
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        self.title = Storyboard.title
    }
    
}

// MARK: - StoreSubscriber
extension FoodItemDetailViewController: StoreSubscriber {
    func newState(state: FoodItemDetailState) {
        print("+++++++++++FoodItemDetailViewController: newState")  // zap
        print("\(state.foodItem)")   //zap
        nameLabel.text = state.foodItem.name
    }
}

// MARK: - Table View Delegate
extension FoodItemDetailViewController: UITableViewDelegate {

}

