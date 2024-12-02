//
//  CACView.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/30/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class CACView: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        fillListItems()
        tableView.reloadData()
    }
    
    var classList = Globals.global.cacList
    
    var primaryCount = Int()
    var secondaryCount = Int()
    var perkCount = Int()
    var lethalTacticalCount = Int()
    var wcCount = Int()
    
    var primaryList = [String]()
    var primaryListImages = [UIImage]()
    var secondaryList = [String]()
    var secondaryListimages = [UIImage]()
    var perkList = [String]()
    var lethalTacticalList = [String]()
    var wcList = [String]()
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("classItemCell", forIndexPath: indexPath) as! AttachmentCell
        cell.aImage.alpha = 1.0
        if indexPath.section == 0 {
            if primaryList.count == 0 {
                cell.aName.text = "NONE"
                cell.aImage.alpha = 0.0
                print("none")
            } else {
                cell.aName!.text = primaryList[indexPath.row]
                cell.aImage!.image = primaryListImages[indexPath.row]
            }
            cell.aType!.text = ""
            
        } else if indexPath.section == 1 {
            if secondaryList.count == 0 {
                cell.aName.text = "NONE"
                cell.aImage.alpha = 0.0
            } else {
                cell.aName.text = secondaryList[indexPath.row]
                if indexPath.row != 0 {
                    cell.aImage.image = AppData().getAttachmentImage(cell.aName.text!)
                } else {
                    cell.aImage.image = AppData().getWeaponSquareImage(cell.aName.text!)
                }
            }
            cell.aType.text = ""
        } else if indexPath.section == 2 {
            if perkList.count == 0 {
                cell.aName.text = "NONE"
                cell.aImage.alpha = 0.0
            } else {
                cell.aName.text = perkList[indexPath.row]
                cell.aImage.image = AppData().getPerkImage(cell.aName.text!)
            }
            cell.aType.text = ""
        } else if indexPath.section == 3 {
            if lethalTacticalList.count == 0 {
                cell.aName.text = "NONE"
                cell.aImage.alpha = 0.0
            } else {
                cell.aName.text = lethalTacticalList[indexPath.row]
                cell.aImage.image = AppData().getEquipmentImage(cell.aName.text!)
            }
            cell.aType.text = ""
        } else if indexPath.section == 4 {
            if wcList.count == 0 {
                cell.aName.text = "NONE"
                cell.aImage.alpha = 0.0
            } else {
                
            }
            cell.aType.text = ""
        }
        
        cell.aImage = QualityOfLife().getRoundedCornerImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if primaryCount == 0 {
                return 1
            }
            return primaryCount
        } else if section == 1 {
            if secondaryCount == 0 {
                return 1
            }
            return secondaryCount
        } else if section == 2 {
            if perkCount == 0 {
                return 1
            }
            return perkCount
        } else if section == 3 {
            if lethalTacticalCount == 0{
                return 1
            }
            return lethalTacticalCount
        } else if section == 4 {
            if wcCount == 0{
                return 1
            }
            return wcCount
        }
        return 1
    }

    func fillListItems(){
        
        // Primaries
        primaryList.append(classList["cacPWeapon"]!)
        primaryList.append(classList["cacPOptic"]!)
        primaryList.append(classList["cacPAtt1"]!)
        primaryList.append(classList["cacPAtt2"]!)
        primaryList.append(classList["cacPAtt3"]!)
        primaryList.append(classList["cacPAtt4"]!)
        primaryList.append(classList["cacPAtt5"]!)
        
        print(primaryList)
        for item in primaryList{
            if item == "none"{
                primaryList.removeAtIndex(primaryList.indexOf(item)!)
            }
        }
        for item in primaryList{
            if primaryList.indexOf(item) == 0 {
                primaryListImages.append(AppData().getWeaponSquareImage(item))
            } else {
                primaryListImages.append(AppData().getAttachmentImage(item))
            }
        }
        print(primaryList)
        print(primaryList.count)
        print(primaryListImages.count)
        primaryCount = primaryList.count
        
        // Secondaries
        secondaryList.append(classList["cacSWeapon"]!)
        secondaryList.append(classList["cacSOptic"]!)
        secondaryList.append(classList["cacSAtt1"]!)
        secondaryList.append(classList["cacSAtt2"]!)
        
        for item in secondaryList{
            if item == "none"{
                secondaryList.removeAtIndex(secondaryList.indexOf(item)!)
            }
        }
        secondaryCount = secondaryList.count
        
        // Perks
        perkList.append(classList["cacPerk1"]!)
        perkList.append(classList["cacPerk1G"]!)
        perkList.append(classList["cacPerk2"]!)
        perkList.append(classList["cacPerk2G"]!)
        perkList.append(classList["cacPerk3"]!)
        perkList.append(classList["cacPerk3G"]!)
        
        for item in perkList{
            if item == "none"{
                perkList.removeAtIndex(perkList.indexOf(item)!)
            }
        }
        perkCount = perkList.count
        
        // Lethals and Tacticals
        lethalTacticalList.append(classList["cacLethal"]!)
        if classList["lethalx2"] == "true"{
            lethalTacticalList.append(classList["cacLethal"]!)
        }
        lethalTacticalList.append(classList["cacTactical"]!)
        if classList["tacticalx2"] == "true"{
            lethalTacticalList.append(classList["cacTactical"]!)
        }
        
        for item in lethalTacticalList{
            if item == "none"{
                lethalTacticalList.removeAtIndex(lethalTacticalList.indexOf(item)!)
            }
        }
        
        lethalTacticalCount = lethalTacticalList.count
        // WC List
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return cellProperties().tableViewHeader("  Primary")
        } else if section == 1 {
            return cellProperties().tableViewHeader("  Secondary")
        } else if section == 2 {
            return cellProperties().tableViewHeader("  Perks")
        } else if section == 3 {
            return cellProperties().tableViewHeader("  Lethals and Tacticals")
        } else if section == 4 {
            return cellProperties().tableViewHeader("  Wildcards")
        }
        return cellProperties().tableViewHeader("  err")
    }
    
    @IBAction func done(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {return UIStatusBarStyle.LightContent}
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {return 5}
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {return cellProperties().basicCellHeightWithImage}
}