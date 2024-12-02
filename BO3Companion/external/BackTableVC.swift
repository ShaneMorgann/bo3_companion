//
//  BackTableVC.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/3/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class BackTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var tableArray = [String]()
    
    @IBOutlet weak var listTopLogo: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let listType = 3
    
    let listAllOriginal = ["Home", "Campaign", "Missions", "Intel", "Achievements/Trophies", "Multiplayer", "Loadout", "Create A Class", "Maps", "Gametypes", "Zombies", "Maps", "Secrets", "Info"] // Type 1
    let listNoCampaign = ["Home", "Multiplayer", "Loadout", "Create A Class", "Maps", "Gametypes", "Zombies", "Maps", "Secrets", "Info"] // Type 2
    let listOnlyMultiplayer = ["Home", "Multiplayer", "Loadout", "Create A Class", "Maps", "Gametypes", "Info"] // Type 3
    
    override func viewDidLoad() {
        tableArray = listOnlyMultiplayer
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if listType == 1 {
            if (indexPath.row == 0){
                cell = tableView.dequeueReusableCellWithIdentifier("mainMenuCell", forIndexPath: indexPath)
            } else if (indexPath.row == 1){
                cell = tableView.dequeueReusableCellWithIdentifier("campaignCell", forIndexPath: indexPath)
            } else if (indexPath.row == 2){
                cell = tableView.dequeueReusableCellWithIdentifier("cMissionsCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 3){
                cell = tableView.dequeueReusableCellWithIdentifier("cIntelCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 4){
                cell = tableView.dequeueReusableCellWithIdentifier("cAchievementsCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 5){
                cell = tableView.dequeueReusableCellWithIdentifier("multiplayerCell", forIndexPath: indexPath)
            } else if (indexPath.row == 6){
                cell = tableView.dequeueReusableCellWithIdentifier("mLoadoutCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 7){
                cell = tableView.dequeueReusableCellWithIdentifier("mCACCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 8){
                cell = tableView.dequeueReusableCellWithIdentifier("mMapsCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 9){
                cell = tableView.dequeueReusableCellWithIdentifier("mGametypesCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 10){
                cell = tableView.dequeueReusableCellWithIdentifier("zombiesCell", forIndexPath: indexPath)
            } else if (indexPath.row == 11){
                cell = tableView.dequeueReusableCellWithIdentifier("zMapsCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 12){
                cell = tableView.dequeueReusableCellWithIdentifier("zSecretsCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 13){
                cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath)
            }
        } else if listType == 2 {
            if (indexPath.row == 0){
                cell = tableView.dequeueReusableCellWithIdentifier("mainMenuCell", forIndexPath: indexPath)
            } else if (indexPath.row == 1){
                cell = tableView.dequeueReusableCellWithIdentifier("multiplayerCell", forIndexPath: indexPath)
            } else if (indexPath.row == 2){
                cell = tableView.dequeueReusableCellWithIdentifier("mLoadoutCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 3){
                cell = tableView.dequeueReusableCellWithIdentifier("mCACCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 4){
                cell = tableView.dequeueReusableCellWithIdentifier("mMapsCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 5){
                cell = tableView.dequeueReusableCellWithIdentifier("mGametypesCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 6){
                cell = tableView.dequeueReusableCellWithIdentifier("zombiesCell", forIndexPath: indexPath)
            } else if (indexPath.row == 7){
                cell = tableView.dequeueReusableCellWithIdentifier("zMapsCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 8){
                cell = tableView.dequeueReusableCellWithIdentifier("zSecretsCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 9){
                cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath)
            }
        } else if listType == 3 {
            if (indexPath.row == 0){
                cell = tableView.dequeueReusableCellWithIdentifier("mainMenuCell", forIndexPath: indexPath)
            } else if (indexPath.row == 1){
                cell = tableView.dequeueReusableCellWithIdentifier("multiplayerCell", forIndexPath: indexPath)
            } else if (indexPath.row == 2){
                cell = tableView.dequeueReusableCellWithIdentifier("mLoadoutCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 3){
                cell = tableView.dequeueReusableCellWithIdentifier("mCACCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 4){
                cell = tableView.dequeueReusableCellWithIdentifier("mMapsCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 5){
                cell = tableView.dequeueReusableCellWithIdentifier("mGametypesCell", forIndexPath: indexPath)
                cell.textLabel?.textColor = UIColor.whiteColor()
            } else if (indexPath.row == 6){
                cell = tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath)
            }
        }
        
        cell.textLabel!.text = tableArray[indexPath.row]
        return cell
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func viewWillAppear(animated: Bool) {
        self.revealViewController().frontViewController.view.userInteractionEnabled = false
    }
    override func viewWillDisappear(animated: Bool) {
        self.revealViewController().frontViewController.view.userInteractionEnabled = true
    }
}