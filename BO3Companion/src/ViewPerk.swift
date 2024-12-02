//
//  ViewPerk.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/20/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ViewPerk: UITableViewController{
    
    var perkName = String()
    
    @IBOutlet var pImage: UIImageView!
    @IBOutlet var pName: UILabel!
    @IBOutlet var pTier: UILabel!
    @IBOutlet var pLevel: UILabel!
    @IBOutlet var pDescription: UITextView!
    @IBOutlet var pUses: UITextView!
    
    override func viewDidLoad(){
        perkName = Globals.global.perkNameSelected
        fillData()
    }
    
    
    func fillData(){
        var dImage = UIImage()
        var dName = String()
        var dLevel = String()
        var dTier = String()
        var dDescription = String()
        var dUses = String()
        
        (dName, dLevel, dTier, dDescription, dUses) = AppData().getPerkData(perkName)
        dImage = AppData().getPerkImage(perkName)
        
        pImage.image = dImage
        pName.text = dName
        pTier.text = dTier
        pLevel.text = dLevel
        pDescription.text = dDescription
        pDescription.textColor = UIColor.whiteColor()
        pUses.text = dUses
        pUses.textColor = UIColor.whiteColor()
        //pImage = QualityOfLife().getRoundedCornerImage(pImage, borderWidth: 2.0, borderColor: .whiteColor())
        
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 4 {
            pDescription.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
        } else if indexPath.row == 5 {
            pUses.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
        }
    }
}