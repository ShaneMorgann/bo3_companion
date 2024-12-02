//
//  ParentVC.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/28/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class ParentVC: UIViewController{
    override func viewDidLoad() {
        let revealController: SWRevealViewController = self.revealViewController()
        //revealController.panGestureRecognizer()
        revealController.tapGestureRecognizer()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {return UIStatusBarStyle.LightContent}
}