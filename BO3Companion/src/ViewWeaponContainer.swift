//
//  ViewWeaponContainer.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/20/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

class ViewWeaponContainer: UIViewController{
    
    @IBAction func backToList(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: {})
    }
}