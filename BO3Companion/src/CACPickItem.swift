//
//  CACPickItem.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/30/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class CACPickItem: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    var identifier = String()
    
    var smgs = [[String]]()
    var assaults = [[String]]()
    var shotguns = [[String]]()
    var lmgs = [[String]]()
    var snipers = [[String]]()
    
    var pistols = [[String]]()
    var launchers = [[String]]()
    var specials = [[String]]()
    
    var attachments = [[String]]()
    
    var perks = [[String]]()
    var equipment = [[String]]()
    var wildcards = [[String]]()
    
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        if identifier == "cacPWeapon"{
            loadPrimaries()
        } else if identifier == "cacPOptic" {
            loadOptics()
        } else if identifier == "cacPAtt1" {
            loadAttachments()
        } else if identifier == "cacPAtt2" {
            loadAttachments()
        } else if identifier == "cacPAtt3" {
            loadAttachments()
        } else if identifier == "cacPAtt4" {
            loadAttachments()
        } else if identifier == "cacPAtt5" {
            loadAttachments()
        } else if identifier == "cacSWeapon" {
            loadSecondaries()
        } else if identifier == "cacSOptic" {
            loadOptics()
        } else if identifier == "cacSAtt1" {
            loadAttachments()
        } else if identifier == "cacSAtt2" {
            loadAttachments()
        } else if identifier == "cacPerk1" {
            loadPerkOnes()
        } else if identifier == "cacPerk1G" {
            loadPerkOnes()
        } else if identifier == "cacPerk2" {
            loadPerkTwos()
        } else if identifier == "cacPerk2G" {
            loadPerkTwos()
        } else if identifier == "cacPerk3" {
            loadPerkThrees()
        } else if identifier == "cacPerk3G" {
            loadPerkThrees()
        } else if identifier == "cacLethal" {
            loadLethals()
        } else if identifier == "cacTactical" {
            loadTacticals()
        } else if identifier == "cacWC1" {
            loadWildcards()
        } else if identifier == "cacWC2" {
            loadWildcards()
        } else if identifier == "cacWC3" {
            loadWildcards()
        }
        setTableBackground()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("attachmentCell", forIndexPath: indexPath) as! AttachmentCell
        
        if identifier == "cacPWeapon"{
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
        } else if identifier == "cacPOptic" {
            cell.aName!.text = attachments[indexPath.row][0]
            cell.aType.text = "Level: " + attachments[indexPath.row][1]
            cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
        } else if identifier == "cacPAtt1" {
            cell.aName!.text = attachments[indexPath.row][0]
            cell.aType.text = "Level: " + attachments[indexPath.row][1]
            cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
        } else if identifier == "cacPAtt2" {
            cell.aName!.text = attachments[indexPath.row][0]
            cell.aType.text = "Level: " + attachments[indexPath.row][1]
            cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
        } else if identifier == "cacPAtt3" {
            cell.aName!.text = attachments[indexPath.row][0]
            cell.aType.text = "Level: " + attachments[indexPath.row][1]
            cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
        } else if identifier == "cacPAtt4" {
            cell.aName!.text = attachments[indexPath.row][0]
            cell.aType.text = "Level: " + attachments[indexPath.row][1]
            cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
        } else if identifier == "cacPAtt5" {
            cell.aName!.text = attachments[indexPath.row][0]
            cell.aType.text = "Level: " + attachments[indexPath.row][1]
            cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
        } else if identifier == "cacSWeapon" {
            if indexPath.section == 0 {
                cell.aName!.text = pistols[indexPath.row][0]
                cell.aType!.text = "Level: " + pistols[indexPath.row][1]
                cell.aImage.image = AppData().getWeaponSquareImage(pistols[indexPath.row][0])
            } else if indexPath.section == 1 {
                cell.aName!.text = launchers[indexPath.row][0]
                cell.aType!.text = "Level: " + launchers[indexPath.row][1]
                cell.aImage.image = AppData().getWeaponSquareImage(launchers[indexPath.row][0])
            } else if indexPath.section == 2 {
                cell.aName!.text = specials[indexPath.row][0]
                cell.aType!.text = "Level: " + specials[indexPath.row][1]
                cell.aImage.image = AppData().getWeaponSquareImage(specials[indexPath.row][0])
            }
        } else if identifier == "cacSOptic" {
            cell.aName!.text = attachments[indexPath.row][0]
            cell.aType.text = "Level: " + attachments[indexPath.row][1]
            cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
        } else if identifier == "cacSAtt1" {
            cell.aName!.text = attachments[indexPath.row][0]
            cell.aType.text = "Level: " + attachments[indexPath.row][1]
            cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
        } else if identifier == "cacSAtt2" {
            cell.aName!.text = attachments[indexPath.row][0]
            cell.aType.text = "Level: " + attachments[indexPath.row][1]
            cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
        } else if identifier == "cacPerk1" {
            cell.aName!.text = perks[indexPath.row][0]
            cell.aType.text = "Level: " + perks[indexPath.row][1]
            cell.aImage.image = AppData().getPerkImage(cell.aName.text!)
        } else if identifier == "cacPerk1G" {
            cell.aName!.text = perks[indexPath.row][0]
            cell.aType.text = "Level: " + perks[indexPath.row][1]
            cell.aImage.image = AppData().getPerkImage(cell.aName.text!)
        } else if identifier == "cacPerk2" {
            cell.aName!.text = perks[indexPath.row][0]
            cell.aType.text = "Level: " + perks[indexPath.row][1]
            cell.aImage.image = AppData().getPerkImage(cell.aName.text!)
        } else if identifier == "cacPerk2G" {
            cell.aName!.text = perks[indexPath.row][0]
            cell.aType.text = "Level: " + perks[indexPath.row][1]
            cell.aImage.image = AppData().getPerkImage(cell.aName.text!)
        } else if identifier == "cacPerk3" {
            cell.aName!.text = perks[indexPath.row][0]
            cell.aType.text = "Level: " + perks[indexPath.row][1]
            cell.aImage.image = AppData().getPerkImage(cell.aName.text!)
        } else if identifier == "cacPerk3G" {
            cell.aName!.text = perks[indexPath.row][0]
            cell.aType.text = "Level: " + perks[indexPath.row][1]
            cell.aImage.image = AppData().getPerkImage(cell.aName.text!)
        } else if identifier == "cacLethal" {
            cell.aName!.text = equipment[indexPath.row][0]
            cell.aType.text = "Level: " + equipment[indexPath.row][1]
            cell.aImage.image = AppData().getEquipmentImage(cell.aName.text!)
        } else if identifier == "cacTactical" {
            cell.aName!.text = equipment[indexPath.row][0]
            cell.aType.text = "Level: " + equipment[indexPath.row][1]
            cell.aImage.image = AppData().getEquipmentImage(cell.aName.text!)
        } else if identifier == "cacWC1" {
            loadWildcards()
        } else if identifier == "cacWC2" {
            loadWildcards()
        } else if identifier == "cacWC3" {
            loadWildcards()
        }
        
        cell.aImage = QualityOfLife().getRoundImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if identifier == "cacPWeapon"{
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
        } else if identifier == "cacPOptic" {
            return attachments.count
        } else if identifier == "cacPAtt1" {
            return attachments.count
        } else if identifier == "cacPAtt2" {
            return attachments.count
        } else if identifier == "cacPAtt3" {
            return attachments.count
        } else if identifier == "cacPAtt4" {
            return attachments.count
        } else if identifier == "cacPAtt5" {
            return attachments.count
        } else if identifier == "cacSWeapon" {
            if section == 0 {
                return pistols.count
            } else if section == 1 {
                return launchers.count
            } else if section == 2 {
                return specials.count
            }
        } else if identifier == "cacSOptic" {
            return attachments.count
        } else if identifier == "cacSAtt1" {
            return attachments.count
        } else if identifier == "cacSAtt2" {
            return attachments.count
        } else if identifier == "cacPerk1" {
            return perks.count
        } else if identifier == "cacPerk1G" {
            return perks.count
        } else if identifier == "cacPerk2" {
            return perks.count
        } else if identifier == "cacPerk2G" {
            return perks.count
        } else if identifier == "cacPerk3" {
           return perks.count
        } else if identifier == "cacPerk3G" {
           return perks.count
        } else if identifier == "cacLethal" {
           return equipment.count
        } else if identifier == "cacTactical" {
           return equipment.count
        } else if identifier == "cacWC1" {
           return wildcards.count
        } else if identifier == "cacWC2" {
           return wildcards.count
        } else if identifier == "cacWC3" {
           return wildcards.count
        }
        return 0
        
    }
    
    func setTableBackground(){
        let imageView: UIImageView = UIImageView(image: UIImage(named: "textViewBackground.jpg"))
        imageView.alpha = 0.85
        self.tableView.backgroundView = imageView
        tableView.backgroundView?.alpha = 0.25
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if identifier == "cacPWeapon"{
            return 5
        }else if identifier == "cacSWeapon" {
            return 3
        }
        return 1
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if identifier == "cacPWeapon"{
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
        } else if identifier == "cacPOptic" {
            if attachments.count > 0 {
                return cellProperties().tableViewHeader("  Optics")
            }
            return cellProperties().tableViewHeader("  NO OPTICS FOUND")
        } else if identifier == "cacPAtt1" {
            if attachments.count > 0 {
                return cellProperties().tableViewHeader("  Attachments")
            }
            return cellProperties().tableViewHeader("  NO ATTACHMENTS FOUND")
        } else if identifier == "cacPAtt2" {
            if attachments.count > 0 {
                return cellProperties().tableViewHeader("  Attachments")
            }
            return cellProperties().tableViewHeader("  NO ATTACHMENTS FOUND")
        } else if identifier == "cacPAtt3" {
            if attachments.count > 0 {
                return cellProperties().tableViewHeader("  Attachments")
            }
            return cellProperties().tableViewHeader("  NO ATTACHMENTS FOUND")
        } else if identifier == "cacPAtt4" {
            if attachments.count > 0 {
                return cellProperties().tableViewHeader("  Attachments")
            }
            return cellProperties().tableViewHeader("  NO ATTACHMENTS FOUND")
        } else if identifier == "cacPAtt5" {
            if attachments.count > 0 {
                return cellProperties().tableViewHeader("  Attachments")
            }
            return cellProperties().tableViewHeader("  NO ATTACHMENTS FOUND")
        } else if identifier == "cacSWeapon" {
            if section == 0 {
                if pistols.count > 0 {
                    return cellProperties().tableViewHeader("  Pistols")
                }
                return cellProperties().tableViewHeader("  NO PISTOLS FOUND")
            } else if section == 1 {
                if launchers.count > 0 {
                    return cellProperties().tableViewHeader("  Launchers")
                }
                return cellProperties().tableViewHeader("  NO LAUNCHERS FOUND")
            } else if section == 2 {
                if specials.count > 0 {
                    return cellProperties().tableViewHeader("  Specials")
                }
                return cellProperties().tableViewHeader("  NO SPECIALS FOUND")
            }
        } else if identifier == "cacSOptic" {
            if attachments.count > 0 {
                return cellProperties().tableViewHeader("  Optics")
            }
            return cellProperties().tableViewHeader("  NO OPTICS FOUND")
        } else if identifier == "cacSAtt1" {
            if attachments.count > 0 {
                return cellProperties().tableViewHeader("  Attachments")
            }
            return cellProperties().tableViewHeader("  NO ATTACHMENTS FOUND")
        } else if identifier == "cacSAtt2" {
            if attachments.count > 0 {
                return cellProperties().tableViewHeader("  Attachments")
            }
            return cellProperties().tableViewHeader("  NO ATTACHMENTS FOUND")
        } else if identifier == "cacPerk1" {
            if perks.count > 0 {
                return cellProperties().tableViewHeader("  Tier One Perks")
            }
            return cellProperties().tableViewHeader("  NO TIER ONE PERKS FOUND")
        } else if identifier == "cacPerk1G" {
            if perks.count > 0 {
                return cellProperties().tableViewHeader("  Tier One Perks(G)")
            }
            return cellProperties().tableViewHeader("  NO TIER ONE PERKS FOUND")
        } else if identifier == "cacPerk2" {
            if perks.count > 0 {
                return cellProperties().tableViewHeader("  Tier Two Perks")
            }
            return cellProperties().tableViewHeader("  NO TIER ONE PERKS FOUND")
        } else if identifier == "cacPerk2G" {
            if perks.count > 0 {
                return cellProperties().tableViewHeader("  Tier Two Perks(G)")
            }
            return cellProperties().tableViewHeader("  NO TIER ONE PERKS FOUND")
        } else if identifier == "cacPerk3" {
            if perks.count > 0 {
                return cellProperties().tableViewHeader("  Tier Three Perks")
            }
            return cellProperties().tableViewHeader("  NO TIER ONE PERKS FOUND")
        } else if identifier == "cacPerk3G" {
            if perks.count > 0 {
                return cellProperties().tableViewHeader("  Tier Three Perks(G)")
            }
            return cellProperties().tableViewHeader("  NO TIER ONE PERKS FOUND")
        } else if identifier == "cacLethal" {
            if equipment.count > 0 {
                return cellProperties().tableViewHeader("  Lethals")
            }
            return cellProperties().tableViewHeader("  NO LETHALS FOUND")
        } else if identifier == "cacTactical" {
            if equipment.count > 0 {
                return cellProperties().tableViewHeader("  Tacticals")
            }
            return cellProperties().tableViewHeader("  NO TACTICALS FOUND")
        } else if identifier == "cacWC1" {
            if wildcards.count > 0 {
                return cellProperties().tableViewHeader("  Wildcards")
            }
            return cellProperties().tableViewHeader("  NO WILDCARDS FOUND")
        } else if identifier == "cacWC2" {
            if wildcards.count > 0 {
                return cellProperties().tableViewHeader("  Wildcards")
            }
            return cellProperties().tableViewHeader("  NO WILDCARDS FOUND")
        } else if identifier == "cacWC3" {
            if wildcards.count > 0 {
                return cellProperties().tableViewHeader("  Wildcards")
            }
            return cellProperties().tableViewHeader("  NO WILDCARDS FOUND")
        }
        return cellProperties().tableViewHeader("  err")
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat { return cellProperties().basicCellHeightWithImage }
    
    func setWeaponClass(){
        let wName = Globals.global.cacList["cacPWeapon"]
        
        (_,_,Globals.global.weaponClassSelected,_,_,_,_,_,_,_,_,_,_,_,_) = AppData().getWeaponData(wName!)
    }
    
    func loadPrimaries(){
        smgs = AppData().getSMGs()
        assaults = AppData().getAssaults()
        shotguns = AppData().getShotguns()
        lmgs = AppData().getLMGs()
        snipers = AppData().getSnipers()
    }
    
    func loadOptics(){
        setWeaponClass()
        let weaponClass = Globals.global.weaponClassSelected
        
        var attachmentClass = String()
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
        let attachmentList = AppData().getAttachmentDataByClass(attachmentClass)
        let opticList = AppData().getOptics()
        
        for att in attachmentList{
            if opticList.contains(att[0]){
                attachments.append([att[0],att[1]])
            }
        }
    }
    
    func loadAttachments(){
        setWeaponClass()
        let weaponClass = Globals.global.weaponClassSelected
        
        var attachmentClass = String()
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
        let attachmentList = AppData().getAttachmentDataByClass(attachmentClass)
        let aList = AppData().getAttachments()
        
        for att in attachmentList{
            if aList.contains(att[0]){
                attachments.append([att[0],att[1]])
            }
        }
        
    }
    
    func loadSecondaries(){
        setWeaponClass()
    }
    
    func loadPerkOnes(){
        perks = AppData().getTierOnePerks()
        if identifier == "cacPerk1G" {
            var perkNames = [String]()
            for perk in perks{
                perkNames.append(perk[0])
            }
            let index = perkNames.indexOf(Globals.global.cacList["cacPerk1"]!)
            perks.removeAtIndex(index!)
        }
    }
    
    func loadPerkTwos(){
        perks = AppData().getTierTwoPerks()
        if identifier == "cacPerk2G" {
            var perkNames = [String]()
            for perk in perks{
                perkNames.append(perk[0])
            }
            let index = perkNames.indexOf(Globals.global.cacList["cacPerk2"]!)
            perks.removeAtIndex(index!)
        }
    }
    
    func loadPerkThrees(){
        perks = AppData().getTierThreePerks()
        if identifier == "cacPerk3G" {
            var perkNames = [String]()
            for perk in perks{
                perkNames.append(perk[0])
            }
            let index = perkNames.indexOf(Globals.global.cacList["cacPerk3"]!)
            perks.removeAtIndex(index!)
        }
    }
    
    func loadLethals(){
        equipment = AppData().getLethals()
        equipment = equipment + AppData().getTacticals()
    }
    
    func loadTacticals(){
        equipment = AppData().getTacticals()
        equipment = equipment + AppData().getLethals()
    }
    
    func loadWildcards(){
        
    }
    @IBAction func noneForItem(sender: UIBarButtonItem) {
        Globals.global.cacSetValue = "none"
        Globals.global.cacSegueID = identifier
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath) as! AttachmentCell
  
        Globals.global.cacSetValue = cell.aName.text!
        Globals.global.cacSegueID = identifier
        if identifier == "cacLethal"{
            let alertController: UIAlertController = UIAlertController(title: "", message: "Two \(cell.aName.text!)s?", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "No", style: .Cancel) { action -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)}
            
            let nextAction = UIAlertAction(title: "Yes", style: .Default) { action -> Void in
                Globals.global.cacList["lethalx2"] = "true"
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(nextAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}