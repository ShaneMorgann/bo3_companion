//
//  ClearDataScreen.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/24/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation



class ClearDataScreen: UIViewController{
    
    @IBOutlet var clearAllData: UIButton!
    
    @IBAction func clearAllDataAction(sender: UIButton) {
        //Downloader().loopAllFiles("Clear Data")
        let dl = Downloader()
        dl.loopAllFiles("Clear Data")
    
    }
}