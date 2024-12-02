//
//  LoadoutGunAttachment.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/20/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class LoadoutGunAttachment: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet var tableView: UITableView!
    
    var attachmentClass = String()
    
    var attachments = [[String]]()
    
    override func viewDidLoad() {
        
        convertClass()
        fillListItems()
        tableView.reloadData()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle { return UIStatusBarStyle.LightContent }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return attachments.count }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("attachmentCell", forIndexPath: indexPath) as! WeaponAttachmentCell
        
        
        // NEED TO REDO OUTLETS FOR TYPE AND NAME
        // OR SWITCH THEM ON THE STORYBOARD
        
        cell.aName.text = attachments[indexPath.row][2]
        cell.aType.text = attachments[indexPath.row][0]
        cell.aLevel.text = "Level: " + attachments[indexPath.row][1]
        cell.aDescription.text = attachments[indexPath.row][3]
        cell.aDescription.textColor = UIColor.whiteColor()
        cell.aImage.image = AppData().getAttachmentImage(cell.aType.text!)
        cell.aImage = QualityOfLife().getRoundImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        cell.aDescription.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
        
        return cell
    }
    
    func convertClass(){
        
        let weaponClass = Globals.global.weaponClassSelected
        
        // Names are not the same as those saved,
        // So I have to convert them here.
        if (weaponClass == "Sub Machine Gun"){
            attachmentClass = "Smg"
        } else if (weaponClass == "Sniper Rifle") {
            attachmentClass = "Sniper"
        } else if (weaponClass == "Assault Rifle") {
            attachmentClass = "Assaultrifle"
        } else if (weaponClass == "Shotgun") {
            attachmentClass = "Shotgun"
        } else if (weaponClass == "Light Machine Gun") {
            attachmentClass = "Lmg"
        }
    }
    
    func fillListItems(){
        attachments = AppData().getAttachmentDataByClass(attachmentClass)
    }
    
    
    @IBAction func backToGun(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
}