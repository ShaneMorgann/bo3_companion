//
//  ViewEquipment.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/28/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class ViewEquipment: UITableViewController{
    
    var equipmentName = String()
    var equipmentType = String()
    
    @IBOutlet var aImage: UIImageView!
    @IBOutlet var aName: UILabel!
    @IBOutlet var aType: UILabel!
    @IBOutlet var aLevel: UILabel!
    @IBOutlet var aDescription: UITextView!
    @IBOutlet var aUsage: UITextView!
    
    override func viewDidLoad(){
        equipmentName = Globals.global.equipmentNameSelected
        equipmentType = Globals.global.equipmentTypeSelected
        fillData()
    }
    
    func fillData(){
        
        var dImage = UIImage()
        var dName = String()
        var dType = String()
        var dLevel = String()
        var dDescription = String()
        var dUsage = String()
        
        if equipmentType == "Lethal"{
            (dName, dLevel, dDescription, dUsage) = AppData().getLethalData(equipmentName)
            dType = "Lethal"
            dImage = AppData().getLethalImage(equipmentName)
        } else if equipmentType == "Tactical"{
            (dName, dLevel, dDescription, dUsage) = AppData().getTacticalData(equipmentName)
            dType = "Tactical"
            dImage = AppData().getTacticalImage(equipmentName)
        }
        
        aImage.image = dImage
        aName.text = dName
        aType.text = dType
        aLevel.text = dLevel
        aDescription.text = dDescription
        aDescription.textColor = UIColor.whiteColor()
        aUsage.text = dUsage
        aUsage.textColor = UIColor.whiteColor()
    }
    
}