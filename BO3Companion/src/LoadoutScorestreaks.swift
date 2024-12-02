//
//  LoadoutScorestreaks.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/28/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation


class LoadoutScorestreaks: ParentVC{
    
    
    @IBOutlet var tableView: UITableView!
    
    var scorestreaks = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillListItems()
        tableView.reloadData()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle { return UIStatusBarStyle.LightContent }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int { return 1 }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return scorestreaks.count }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {return 90}
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("attachmentCell", forIndexPath: indexPath) as! WeaponAttachmentCell
        
        
        cell.aName.text = scorestreaks[indexPath.row][0] + " points"
        cell.aType.text = scorestreaks[indexPath.row][1]
        cell.aLevel.text = "    Level: " + scorestreaks[indexPath.row][2]
        cell.aDescription.text = scorestreaks[indexPath.row][3]
        cell.aDescription.textColor = UIColor.whiteColor()
        cell.aImage.image = AppData().getScorestreakImage(cell.aType.text!)
        cell.aImage = QualityOfLife().getRoundImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        cell.aDescription.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
        
        return cell
    }
    
    func fillListItems(){
        scorestreaks = AppData().getScorestreaks()
        print (scorestreaks)
        var tempArray = [[String]]()
        
        for streak in scorestreaks{
            var tempName = String()
            var tempLevel = String()
            var tempPoints = String()
            var tempDesc = String()
            
            (tempName, tempLevel, tempPoints, tempDesc) = AppData().getScorestreakData(streak[0])
            
            tempArray.append([tempPoints, tempName, tempLevel, tempDesc])
        }
        scorestreaks = tempArray
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: WeaponAttachmentCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.aDescription.setContentOffset(CGPointMake(0.0, 0.0), animated: false)
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
}