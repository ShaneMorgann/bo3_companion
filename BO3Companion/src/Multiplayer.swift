//
//  Multiplayer.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/12/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import UIKit

class Multiplayer: ParentVC{
    
    @IBOutlet var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu.target = self.revealViewController()
        menu.action = Selector("revealToggle:")
        
        classOfDay.clipsToBounds = true
        classOfDay.layer.borderWidth = 1.0
        classOfDay.layer.borderColor = UIColor.whiteColor().CGColor
        classOfDay.layer.cornerRadius = 5.0
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    @IBOutlet var classOfDay: UIButton!
    
    
}