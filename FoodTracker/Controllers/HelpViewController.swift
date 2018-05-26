//
//  HelpViewController.swift
//  FoodTracker
//
//  Created by Michael Vork on 5/26/18.
//  Copyright © 2018 Michael Vork. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setHelpText(withText text: String) {
        textView.text = text
    }
}
