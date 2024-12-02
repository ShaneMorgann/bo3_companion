//
//  LoadoutEquipment.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/28/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class LoadoutEquipment: ParentVC{
    @IBOutlet var menu: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    // Lists for tableView
    var lethals = [[String]]()
    var tacticals = [[String]]()
    
    
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
            cell.aImage.image = AppData().getLethalImage(lethals[indexPath.row][0])
            cell.aName.text = lethals[indexPath.row][0]
            cell.aType.text = "Level: " + lethals[indexPath.row][1]
        } else if indexPath.section == 1 {
            cell.aImage.image = AppData().getTacticalImage(tacticals[indexPath.row][0])
            cell.aName.text = tacticals[indexPath.row][0]
            cell.aType.text = "Level: " + tacticals[indexPath.row][1]
        }
        
        cell.aImage = QualityOfLife().getRoundImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            if lethals.count > 0 {
                return (cellProperties().tableViewHeader("  Lethals"))
            }
            return cellProperties().tableViewHeader("  NO LETHALS FOUND")
        } else if section == 1 {
            if tacticals.count > 0 {
                return (cellProperties().tableViewHeader("  Tacticals"))
            }
            return cellProperties().tableViewHeader("  NO TACTICALS FOUND")
        }
        return cellProperties().tableViewHeader("  err")
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return lethals.count
        } else if section == 1 {
            return tacticals.count
        }
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "view"){
            let indexPath : NSIndexPath = tableView.indexPathForSelectedRow!
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! AttachmentCell
            let attachmentName = (cell.aName.text)!
            
            Globals.global.equipmentNameSelected = attachmentName
            
            if indexPath.section == 0 {
                Globals.global.equipmentTypeSelected = "Lethal"
            } else if indexPath.section == 1 {
                Globals.global.equipmentTypeSelected = "Tactical"
            }
        }
    }
    
    func fillListItems(){
        lethals = AppData().getLethals()
        tacticals = AppData().getTacticals()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {return 2}
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {return cellProperties().basicCellHeightWithImage}
    override func preferredStatusBarStyle() -> UIStatusBarStyle {return UIStatusBarStyle.LightContent}
}