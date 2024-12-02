//
//  UpdateScreen.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/18/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import UIKit

class UpdateScreen: UIViewController{
    
    @IBOutlet var logText: UITextView!
    @IBOutlet var progMess: UILabel!
    @IBOutlet var progBar: UIProgressView!
    
    var delete = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateLog:", name:"updateLog", object: nil)
    }
 
    @IBAction func checkForUpdates(sender: UIButton) {
        sender.enabled = false
        let updater = Downloader()
        updater.downloadDelegator("")
        
    }
    func updateLog(notification: NSNotification){
        let originalText = logText.text
        
        if(logText.text.isEmpty){
            logText.text = Globals.global.updateLogMessage
            
        } else {
            logText.text = Globals.global.updateLogMessage + "\n" + originalText
        }
        
        logText.textColor = UIColor.greenColor()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}