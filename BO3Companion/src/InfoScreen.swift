//
//  InfoScreen.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/24/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import UIKit

class InfoScreen: ParentVC{
    
    @IBOutlet var menu: UIBarButtonItem!
    
    @IBOutlet var dataVersion: UILabel!
    let dataV = NSUserDefaults.standardUserDefaults().integerForKey("appVersion")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target = self.revealViewController()
        menu.action = Selector("revealToggle:")
    }
    
    override func viewWillAppear(animated: Bool) {
        dataVersion.text = "Your Data Version: \(dataV)"
    }
}