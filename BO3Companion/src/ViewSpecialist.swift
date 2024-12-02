//
//  ViewSpecialist.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/28/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class ViewSpecialist: UITableViewController{
    
    var specialistCallsign = String()
    
    @IBOutlet var sImage: UIImageView!
    
    @IBOutlet var sCallsign: UILabel!
    @IBOutlet var sName: UILabel!
    @IBOutlet var sBio: UITextView!
    @IBOutlet var sLevel: UILabel!
    
    @IBOutlet var sPWImage: UIImageView!
    @IBOutlet var sPWName: UILabel!
    @IBOutlet var sPWDesc: UITextView!
    
    @IBOutlet var sAbilityImage: UIImageView!
    @IBOutlet var sAbilityName: UILabel!
    @IBOutlet var sAbilityDesc: UITextView!
    
    
    override func viewDidLoad(){
        specialistCallsign = Globals.global.specialistCallsignSelected
        fillData()
    }
    
    func fillData() {
     
        var dImage = UIImage()
        
        var dCallsign = String()
        var dName = String()
        var dBio = String()
        var dLevel = String()
        
        var dPWImage = UIImage()
        var dPWName = String()
        var dPWDesc = String()
        
        var dAbilityImage = UIImage()
        var dAbilityName = String()
        var dAbilityDesc = String()
        
        (dName, dPWName, dAbilityName, dCallsign, dLevel, dBio, dPWDesc, dAbilityDesc) = AppData().getSpecialistData(specialistCallsign)
        print(dName)
        dImage = AppData().getSpecialistMainImage(specialistCallsign)
        dPWImage = AppData().getSpecialistPWImage(specialistCallsign)
        dAbilityImage = AppData().getSpecialistAbilityImage(specialistCallsign)
        
        sCallsign.text = dCallsign
        sName.text = dName
        sBio.text = dBio
        sBio.textColor = UIColor.whiteColor()
        sLevel.text = dLevel
        sPWName.text = dPWName
        sPWDesc.text = dPWDesc
        sPWDesc.textColor = UIColor.whiteColor()
        sAbilityName.text = dAbilityName
        sAbilityDesc.text = dAbilityDesc
        sAbilityDesc.textColor = UIColor.whiteColor()
        
        sImage.image = dImage
        sPWImage.image = dPWImage
        sAbilityImage.image = dAbilityImage
        
        sPWImage = QualityOfLife().getRoundImage(sPWImage, borderWidth: 2.0, borderColor: .blackColor())
        sAbilityImage = QualityOfLife().getRoundImage(sAbilityImage, borderWidth: 2.0, borderColor: .blackColor())
        
        
    }
}