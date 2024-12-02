//
//  UIStoryboardSegueFromLeft.swift
//  BO3 Class Generator
//
//  Created by Shane Morgan on 9/12/15.
//  Copyright (c) 2015 Shane Morgan. All rights reserved.
//

import UIKit

class UIStoryboardSegueFromLeft: UIStoryboardSegue {
    
    override func perform() {
        
        let firstVCView = self.sourceViewController.view as UIView!
        let secondVCView = self.destinationViewController.view as UIView!
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        secondVCView.frame = CGRectMake(-screenWidth, 0.0, screenWidth, screenHeight)
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, screenWidth, 0.0)
            secondVCView.frame = CGRectOffset(secondVCView.frame, screenWidth, 0.0)
            
            }) { (Finished) -> Void in
                self.sourceViewController.presentViewController(self.destinationViewController, animated: false, completion: nil)
                
        }
        
    }
}
