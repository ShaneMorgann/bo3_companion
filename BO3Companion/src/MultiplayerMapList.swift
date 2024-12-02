//
//  MapList.swift
//  BO3Companion
//
//  Created by Shane Morgan on 11/2/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation


class MultiplayerMapList: ParentVC, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var menu: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    var mapList = [[String]]()
    var original = [String]()
    var dlc = [String]()
    
    override func viewDidLoad() {
        menu.target = self.revealViewController()
        menu.action = Selector("revealToggle:")
        setTableBackground()
        fillList()
        tableView.reloadData()
    }
    
    func setTableBackground(){
        let imageView: UIImageView = UIImageView(image: UIImage(named: "textViewBackground.jpg"))
        imageView.alpha = 0.85
        self.tableView.backgroundView = imageView
        tableView.backgroundView?.alpha = 0.25
    }
    
    func fillList(){
        mapList = AppData().getMultiMaps()
        for map in mapList{
            if map[1] == "false" {
                original.append(map[0])
            } else {
                dlc.append(map[0])
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return original.count
        } else if section == 1 {
            return dlc.count
        }
        return 0
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "view"{
            let indexPath : NSIndexPath = tableView.indexPathForSelectedRow!
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! AttachmentCell
            Globals.global.mapNameSelected = cell.aName.text!
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if dlc.count > 0 {
            return 2
        }
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = AttachmentCell()
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("mapCell", forIndexPath: indexPath) as! AttachmentCell
            cell.aName.text = original[indexPath.row]
            cell.aImage.image = AppData().getMapImage(cell.aName.text!, type: "main")
        } else if indexPath.section == 1 {
            tableView.dequeueReusableCellWithIdentifier("mapDLCCell", forIndexPath: indexPath) as! AttachmentCell
            cell.aName.text = dlc[indexPath.row]
            cell.aImage.image = AppData().getMapImage(cell.aName.text!, type: "main")
        }
        cell.aImage = QualityOfLife().getRoundImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        return cell
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            if original.count > 0 {
                return cellProperties().tableViewHeader("  Original")
            }
            return cellProperties().tableViewHeader("  NO ORIGINAL MAPS FOUND")
        } else if section == 1 {
            if dlc.count > 0 {
                return cellProperties().tableViewHeader("  DLC")
            }
            return cellProperties().tableViewHeader("  NO DLC MAPS FOUND")
        }
        return cellProperties().tableViewHeader("  err")
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {return cellProperties().basicCellHeightWithImage}
    override func preferredStatusBarStyle() -> UIStatusBarStyle {return UIStatusBarStyle.LightContent}
}