//
//  Loadout.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/12/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import CoreData

class LoadoutGuns: ParentVC, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var menu: UIBarButtonItem!
    
    var smgs = [[String]]()
    var assaults = [[String]]()
    var shotguns = [[String]]()
    var lmgs = [[String]]()
    var snipers = [[String]]()
    
    var pistols = [[String]]()
    var launchers = [[String]]()
    var specials = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.target = self.revealViewController()
        menu.action = Selector("revealToggle:")
        
        setTableBackground()
        fillListItems()
        tableView.reloadData()
        
    }
    
    func setTableBackground(){
        let imageView: UIImageView = UIImageView(image: UIImage(named: "textViewBackground.jpg"))
        imageView.alpha = 0.85
        self.tableView.backgroundView = imageView
        tableView.backgroundView?.alpha = 0.25
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("attachmentCell", forIndexPath: indexPath) as! AttachmentCell
        
        if indexPath.section == 0 {
            cell.aName!.text = smgs[indexPath.row][0]
            cell.aType!.text = "Level: " + smgs[indexPath.row][1]
            cell.aImage.image = AppData().getWeaponSquareImage(smgs[indexPath.row][0])
        } else if indexPath.section == 1 {
            cell.aName!.text = assaults[indexPath.row][0]
            cell.aType!.text = "Level: " + assaults[indexPath.row][1]
            cell.aImage.image = AppData().getWeaponSquareImage(assaults[indexPath.row][0])
        } else if indexPath.section == 2 {
            cell.aName!.text = shotguns[indexPath.row][0]
            cell.aType!.text = "Level: " + shotguns[indexPath.row][1]
            cell.aImage.image = AppData().getWeaponSquareImage(shotguns[indexPath.row][0])
        } else if indexPath.section == 3 {
            cell.aName!.text = lmgs[indexPath.row][0]
            cell.aType!.text = "Level: " + lmgs[indexPath.row][1]
            cell.aImage.image = AppData().getWeaponSquareImage(lmgs[indexPath.row][0])
        } else if indexPath.section == 4 {
            cell.aName!.text = snipers[indexPath.row][0]
            cell.aType!.text = "Level: " + snipers[indexPath.row][1]
            cell.aImage.image = AppData().getWeaponSquareImage(snipers[indexPath.row][0])
        }
        
        cell.aImage = QualityOfLife().getRoundImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return smgs.count
        } else if section == 1 {
            return assaults.count
        } else if section == 2 {
            return shotguns.count
        } else if section == 3 {
            return lmgs.count
        } else if section == 4 {
            return snipers.count
        }
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "view"{
            let indexPath : NSIndexPath = tableView.indexPathForSelectedRow!
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! AttachmentCell
            let weaponName = (cell.aName?.text)!
            Globals.global.weaponNameSelected = weaponName
        }
    }
    
    func fillListItems(){
        smgs = AppData().getSMGs()
        assaults = AppData().getAssaults()
        shotguns = AppData().getShotguns()
        lmgs = AppData().getLMGs()
        snipers = AppData().getSnipers()
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if smgs.count > 0 {
                return cellProperties().tableViewHeader("  Sub Machine Guns")
            }
            return cellProperties().tableViewHeader("  NO SUB MACHINE GUNS FOUND")
        } else if section == 1 {
            if assaults.count > 0 {
                return cellProperties().tableViewHeader("  Assault Rifles")
            }
            return cellProperties().tableViewHeader("  NO ASSAULT RIFLES FOUND")
        } else if section == 2 {
            if shotguns.count > 0 {
                return cellProperties().tableViewHeader("  Shotguns")
            }
            return cellProperties().tableViewHeader("  NO SHOTGUNS FOUND")
        } else if section == 3 {
            if lmgs.count > 0 {
                return cellProperties().tableViewHeader("  Light Machine Guns")
            }
            return cellProperties().tableViewHeader("  NO LIGHT MACHINE GUNS FOUND")
        } else if section == 4 {
            if snipers.count > 0 {
                return cellProperties().tableViewHeader("  Sniper Rifles")
            }
            return cellProperties().tableViewHeader("  NO SNIPER RIFLES FOUND")
        }
        return cellProperties().tableViewHeader("  err")
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {return UIStatusBarStyle.LightContent}
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {return 5}
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {return cellProperties().basicCellHeightWithImage}
}