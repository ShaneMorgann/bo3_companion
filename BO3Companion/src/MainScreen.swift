//
//  MainScreen.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/12/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import CoreData

class MainScreen: ParentVC{
    
    @IBOutlet var menu: UIBarButtonItem!
    @IBOutlet var imageView: UIImageView!
    
    let downloader = Downloader()

    @IBOutlet var newInCodView: UITextView!
    @IBOutlet var missionOfDayView: UITextView!
    
    let backColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 0.6)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target = self.revealViewController()
        menu.action = Selector("revealToggle:")
        newInCodView.backgroundColor = backColor
        missionOfDayView.backgroundColor = backColor
        newInCodView.textColor = UIColor.whiteColor()
        missionOfDayView.textColor = UIColor.whiteColor()
        
        //print(AppData().getMultiMaps())
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        newInCodView.backgroundColor = backColor
        missionOfDayView.backgroundColor = backColor
        newInCodView.textColor = UIColor.whiteColor()
        missionOfDayView.textColor = UIColor.whiteColor()
        if !(Globals.global.hasTimerMain){
            if(Globals.global.canCheckMain){
                downloader.getMetaData(true)
                
                newInCodView.text = "Loading.."
                missionOfDayView.text = "Loading.."
                
                downloader.mainScreenSetup(false)
                NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainScreen.updateMainMessages(_:)), name:"mainMessages", object: nil)
                Globals.global.timerMain = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(MainScreen.setCheckMessages), userInfo: nil, repeats: false)
                Globals.global.hasTimerMain = true
            } else {
                //newInCodView.text = AppData().getHomeNewInCod()
                //missionOfDayView.text = AppData().getHomeMessageOfDay()
            }
        } else {
            //newInCodView.text = AppData().getHomeNewInCod()
            //missionOfDayView.text = AppData().getHomeMessageOfDay()
        }
        
    }
    
    func setCheckMessages(){
        Globals.global.timerMain.invalidate()
        Globals.global.canCheckMain = true
        Globals.global.hasTimerMain = false
    }
    
    func updateMainMessages(notification: NSNotification){
        let newArray = downloader.getNewInCod()
        let missionArray = downloader.getMissionOfDay()
        
        self.newInCodView.text = ""
        self.missionOfDayView.text = ""
        
        for line in newArray{
            self.newInCodView.text = self.newInCodView.text + line
            if newArray.indexOf(line) < newArray.count - 1 {
                self.newInCodView.text = self.newInCodView.text + "\n"
            }
        }
        for line in missionArray{
            self.missionOfDayView.text = self.missionOfDayView.text + line
            if missionArray.indexOf(line) < missionArray.count - 1 {
                self.missionOfDayView.text = self.missionOfDayView.text + "\n"
            }
        }
        
        newInCodView.backgroundColor = backColor
        missionOfDayView.backgroundColor = backColor
        
        newInCodView.textColor = UIColor.whiteColor()
        missionOfDayView.textColor = UIColor.whiteColor()
        
        print(downloader.appStoreVersion)
        print(NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String)
        
        if String(downloader.appStoreVersion) == NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String{
            print("Same verison")
        } else {
            
            let alertController: UIAlertController = UIAlertController(title: "There's an update available!", message: "Your app version is out of date. If you try updating your data, some content may not be viewable.", preferredStyle: .Alert)
            let okayAction = UIAlertAction(title: "Okay", style: .Cancel) { action -> Void in}
            alertController.addAction(okayAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        if downloader.appVersion < downloader.manifestVersion {
            let alertController: UIAlertController = UIAlertController(title: "There's a patch available!", message: "Would you like to update now?", preferredStyle: .Alert)
            
            let noAction = UIAlertAction(title: "No", style: .Cancel) { action -> Void in}
            let yesAction = UIAlertAction(title: "Yes", style: .Default) { action -> Void in
                self.doSegue()
            }
            
            alertController.addAction(noAction)
            alertController.addAction(yesAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    func doSegue(){
        performSegueWithIdentifier("toUpdateScreen", sender: self)
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}