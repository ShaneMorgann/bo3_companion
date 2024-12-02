//
//  Campaign.swift
//  BO3Companion
//
//  Created by Shane Morgan on 11/1/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class Campaign: ParentVC{
    
    @IBOutlet var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target = self.revealViewController()
        menu.action = Selector("revealToggle:")
    }
}