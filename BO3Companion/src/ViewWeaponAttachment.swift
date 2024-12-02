//
//  ViewWeaponAttachment.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/20/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ViewWeaponAttachment: UITableViewController{
    
    var attachmentName = Globals.global.attachmentNameSelected
    var weaponClass = Globals.global.weaponClassSelected
    
    @IBOutlet var attachmentTable: UITableView!
    
    @IBOutlet var aName: UILabel!
    @IBOutlet var aType: UILabel!
    @IBOutlet var aLevel: UILabel!
    @IBOutlet var aDescription: UITextView!
    @IBOutlet var aAvailable: UITextView!
    
    override func viewDidLoad() {
        print(attachmentName)
        print(weaponClass)
        
        if (weaponClass == "Sub Machine Gun"){
            weaponClass = "Smg"
        } else if (weaponClass == "Sniper Rifle") {
            weaponClass = "Sniper"
        } else if (weaponClass == "Assault Rifle") {
            weaponClass = "Assaultrifle"
        } else if (weaponClass == "Shotgun") {
            weaponClass = "Shotgun"
        } else if (weaponClass == "Light Machine Gun") {
            weaponClass = "Lmg"
        }
        
        fillTable()
    }
    
    func fillTable(){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Attachment")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "attachmentName = %@", attachmentName)
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    if let attachmentName = result.valueForKey("attachmentName") as? String {
                        aName.text = attachmentName
                    }
                    if let attachmentLevel = result.valueForKey("lvlAvailable\(weaponClass)") as? String {
                        aLevel.text = attachmentLevel
                    }
                    if let attachmentType = result.valueForKey("attachmentType") as? String {
                        aType.text = attachmentType
                    }
                    if let attachmentDescription = result.valueForKey("attachmentDescription") as? String {
                        aDescription.text = attachmentDescription
                        aDescription.textColor = UIColor.whiteColor()
                        aDescription.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
                    }
                    if let available = result.valueForKey("attachmentAvailable") as? String {
                        let descArray = available.componentsSeparatedByString(",")
                        for val in descArray{
                            aAvailable.text = aAvailable.text + val
                            if descArray.indexOf(val) != descArray.count - 1 {
                                aAvailable.text = aAvailable.text + "\n"
                            }
                        }
                        aAvailable.textColor = UIColor.whiteColor()
                        aAvailable.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
                    }
                }
            }
            
        }
        catch {
            print("Could not fetch.")
        }

    }
}