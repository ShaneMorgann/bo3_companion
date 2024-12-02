//
//  ViewWeapon.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/11/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ViewWeapon: UITableViewController{
    
    @IBOutlet var weaponTable: UITableView!
    
    var weaponName = String()
    
    @IBOutlet var wImage: UIImageView!
    @IBOutlet var wName: UILabel!
    @IBOutlet var wLevel: UILabel!
    @IBOutlet var wClass: UILabel!
    @IBOutlet var wType: UILabel!
    @IBOutlet var wFireMode: UILabel!
    @IBOutlet var wDescription: UITextView!
    @IBOutlet var wTotalAmmo: UILabel!
    @IBOutlet var wMagSize: UILabel!
    @IBOutlet var wRateOfFire: UILabel!
    @IBOutlet var wReloadTime: UILabel!
    @IBOutlet var wADSTime: UILabel!
    @IBOutlet var wDamageC: UILabel!
    @IBOutlet var wDamageF: UILabel!
    @IBOutlet var wPros: UITextView!
    @IBOutlet var wCons: UITextView!
    
   
    
    override func viewDidLoad(){
        weaponName = Globals.global.weaponNameSelected
        fillData()
    }
    
    func fillData(){
        var dImage = UIImage()
        var dName = String()
        var dLvl = String()
        var dClass = String()
        var dType = String()
        var dFireMode = String()
        var dDescription = String()
        var dTotalAmmo = String()
        var dMagSize = String()
        var dROF = String()
        var dReload = String()
        var dADS = String()
        var dDamageC = String()
        var dDamageF = String()
        var dPros = String()
        var dCons = String()
        
        (dName, dLvl, dClass, dType, dFireMode, dDescription, dTotalAmmo, dMagSize, dROF, dReload, dADS, dDamageC, dDamageF, dPros, dCons) = AppData().getWeaponData(weaponName)
        dImage = AppData().getWeaponMainImage(weaponName)
        
        wImage.image = dImage
        wName.text = dName
        wLevel.text = dLvl
        wClass.text = dClass
        wType.text = dType
        wFireMode.text = dFireMode
        wDescription.text = dDescription
        wDescription.textColor = UIColor.whiteColor()
        wTotalAmmo.text = dTotalAmmo
        wMagSize.text = dMagSize
        wRateOfFire.text = dROF
        wReloadTime.text = dReload
        wADSTime.text = dADS
        wDamageC.text = dDamageC
        wDamageF.text = dDamageF
        wPros.text = dPros
        wPros.textColor = UIColor.whiteColor()
        wCons.text = dCons
        wCons.textColor = UIColor.whiteColor()
        
        Globals.global.weaponClassSelected = dClass
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 6 {
            wDescription.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
        } else if indexPath.row == 14 {
            wPros.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
        } else if indexPath.row == 15 {
            wCons.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
        }
    }
}