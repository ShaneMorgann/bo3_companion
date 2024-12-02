//
//  CACMain.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/30/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class CACMain: ParentVC {
    
    @IBOutlet var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target = self.revealViewController()
        menu.action = Selector("revealToggle:")
    }
    
}