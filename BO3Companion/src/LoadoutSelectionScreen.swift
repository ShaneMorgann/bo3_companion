//
//  LoadoutSelectionScreen.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/20/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

class LoadoutSelectionScreen: ParentVC{
    
    @IBOutlet var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target = self.revealViewController()
        menu.action = Selector("revealToggle:")
    }
}
