//
//  MultiplayerMapInfo.swift
//  BO3Companion
//
//  Created by Shane Morgan on 11/2/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation


class MultiplayerMapInfo: UITableViewController{
    
    @IBOutlet var mImage: UIImageView!
    
    @IBOutlet var mName: UILabel!
    @IBOutlet var mLoc: UILabel!
    @IBOutlet var mDesc: UITextView!
    
    var mapName = Globals.global.mapNameSelected
    
    override func viewDidLoad() {
        fillItems()
    }

    func fillItems(){
        (mName.text!, mLoc.text!, mDesc.text!) = AppData().getCoreMapData(mapName)
        mDesc.textColor = UIColor.whiteColor()
        mImage.image = AppData().getMapImage(mName.text!, type: "main")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let id = segue.identifier
        let destVC = segue.destinationViewController as! MultiplayerMapImage
        destVC.mapName = mName.text!
        if id == "regular"{
            destVC.mapType = ""
        } else if id == "dom"{
            destVC.mapType = "Dom"
        } else if id == "uplink"{
            destVC.mapType = "Uplink"
        } else if id == "demo"{
            destVC.mapType = "Demo"
        } else if id == "snd"{
            destVC.mapType = "SND"
        }
    }
}