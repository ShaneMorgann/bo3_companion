//
//  LoadoutAttachments.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/24/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class LoadoutAttachments: ParentVC, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet var menu: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    // Lists for tableView
    var opticNames = [String]()
    var attachmentNames = [String]()
    
    
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
            cell.aImage.image = AppData().getOpticImage(opticNames[indexPath.row])
            cell.aName.text = opticNames[indexPath.row]
            cell.aType.text = "Optic"
        } else if indexPath.section == 1 {
            cell.aImage.image = AppData().getAttachmentImage(attachmentNames[indexPath.row])
            cell.aName.text = attachmentNames[indexPath.row]
            cell.aType.text = "Attachment"
        }
        
        cell.aImage = QualityOfLife().getRoundImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            if opticNames.count > 0 {
                return (cellProperties().tableViewHeader("  Optics"))
            }
            return cellProperties().tableViewHeader("  NO OPTICS FOUND")
        } else if section == 1 {
            if attachmentNames.count > 0 {
                return (cellProperties().tableViewHeader("  Attachments"))
            }
            return cellProperties().tableViewHeader("  NO ATTACHMENTS FOUND")
        }
        return cellProperties().tableViewHeader(" err")
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return opticNames.count
        } else if section == 1 {
            return attachmentNames.count
        }
        return 1
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "view"){
            let indexPath : NSIndexPath = tableView.indexPathForSelectedRow!
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! AttachmentCell
            let attachmentName = (cell.aName.text)!
            
            Globals.global.attachmentNameSelected = attachmentName
        }
    }
    
    func fillListItems(){
        opticNames = AppData().getOptics()
        attachmentNames = AppData().getAttachments()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {return 2}
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {return cellProperties().basicCellHeightWithImage}
    override func preferredStatusBarStyle() -> UIStatusBarStyle {return UIStatusBarStyle.LightContent}
}