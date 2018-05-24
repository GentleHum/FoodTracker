//
//  UITableView.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/23/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import UIKit

extension UITableView {
    func scrollToTop(ofSection section: Int) {
        DispatchQueue.main.async {
            if self.numberOfRows(inSection: section) > 0 {
                self.scrollToRow(at: IndexPath(row: 0, section: section), at: .top, animated: true)
            }
        }
    }
}
