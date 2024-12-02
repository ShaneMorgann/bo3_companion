//
//  ViewAttachment.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/24/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import CoreData

class ViewAttachment: UITableViewController{
    
    var attachmentName = String()
    
    @IBOutlet var aImage: UIImageView!
    @IBOutlet var aName: UILabel!
    @IBOutlet var aType: UILabel!
    @IBOutlet var aDescription: UITextView!
    @IBOutlet var lvlSMG: UILabel!
    @IBOutlet var lvlAssault: UILabel!
    @IBOutlet var lvlShotgun: UILabel!
    @IBOutlet var lvlLMG: UILabel!
    @IBOutlet var lvlSniper: UILabel!
    @IBOutlet var lvlPistol: UILabel!
    
    override func viewDidLoad(){
        attachmentName = Globals.global.attachmentNameSelected
        fillData()
    }
    
    func fillData(){
        
        var dImage = UIImage()
        var dName = String()
        var dType = String()
        var dDescription = String()
        var dLvlSMG = String()
        var dLvlAssault = String()
        var dLvlShotgun = String()
        var dLvlLMG = String()
        var dLvlSniper = String()
        var dLvlPistol = String()
        
        (dName, dType, dDescription, dLvlSMG, dLvlAssault, dLvlShotgun, dLvlLMG, dLvlSniper, dLvlPistol) = AppData().getAttachmentByName(attachmentName)
        dImage = AppData().getAttachmentImage(attachmentName)
        
        aImage.image = dImage
        aName.text = dName
        aType.text = dType
        aDescription.text = dDescription
        aDescription.textColor = UIColor.whiteColor()
        lvlSMG.text = dLvlSMG
        lvlAssault.text = dLvlAssault
        lvlShotgun.text = dLvlShotgun
        lvlLMG.text = dLvlLMG
        lvlSniper.text = dLvlSniper
        lvlPistol.text = dLvlPistol
        
    }
}