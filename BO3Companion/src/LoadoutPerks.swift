//
//  LoadoutPerks.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/20/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import CoreData

class LoadoutPerks: ParentVC, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var menu: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    var tierOne = [[String]]()
    var tierTwo = [[String]]()
    var tierThree = [[String]]()
    
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
            cell.aName.text = tierOne[indexPath.row][0]
            cell.aType.text = "Level: " + tierOne[indexPath.row][1]
            cell.aImage.image = AppData().getPerkImage(tierOne[indexPath.row][0])
        } else if indexPath.section == 1 {
            cell.aName.text = tierTwo[indexPath.row][0]
            cell.aType.text = "Level: " + tierTwo[indexPath.row][1]
            cell.aImage.image = AppData().getPerkImage(tierTwo[indexPath.row][0])
        } else if indexPath.section == 2 {
            cell.aName.text = tierThree[indexPath.row][0]
            cell.aType.text = "Level: " + tierThree[indexPath.row][1]
            cell.aImage.image = AppData().getPerkImage(tierThree[indexPath.row][0])
        }
        cell.aImage = QualityOfLife().getRoundImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tierOne.count
        } else if section == 1 {
            return tierTwo.count
        } else if section == 2 {
            return tierThree.count
        }
        return 1
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 0 {
            if tierOne.count > 0 { return cellProperties().tableViewHeader("  Tier One")
            }
            return cellProperties().tableViewHeader("  NO TIER ONE PERKS FOUND")
        } else if section == 1 {
            if tierTwo.count > 0 { return cellProperties().tableViewHeader("  Tier Two")
            }
            return cellProperties().tableViewHeader("  NO TIER TWO PERKS FOUND")
        } else if section == 2 {
            if tierThree.count > 0 { return cellProperties().tableViewHeader("  Tier Three")
            }
            return cellProperties().tableViewHeader("  NO TIER THREE PERKS FOUND")
        }
        return cellProperties().tableViewHeader("  err")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "view" {
            let indexPath : NSIndexPath = tableView.indexPathForSelectedRow!
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! AttachmentCell
            let perkName = (cell.aName.text)!
        
            Globals.global.perkNameSelected = perkName
        }
    }
    
    func fillListItems(){
        tierOne = AppData().getTierOnePerks()
        tierTwo = AppData().getTierTwoPerks()
        tierThree = AppData().getTierThreePerks()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle { return UIStatusBarStyle.LightContent }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 3 }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {return cellProperties().basicCellHeightWithImage}
}