//
//  LoadoutSpecialist.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/28/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class LoadoutSpecialist: ParentVC, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet var menu: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    // Lists for tableView
    var specialists = [[String]]()
    
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
        
        cell.aName.text = specialists[indexPath.row][0]
        cell.aType.text = "Level: " + specialists[indexPath.row][1]
        cell.aImage.image = AppData().getSpecialistMainImage(cell.aName.text!)
        cell.aImage = QualityOfLife().getRoundImage(cell.aImage, borderWidth: 2.0, borderColor: .blackColor())
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specialists.count
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "view"){
            let indexPath : NSIndexPath = tableView.indexPathForSelectedRow!
            let cell = tableView.cellForRowAtIndexPath(indexPath) as! AttachmentCell
            let callsign = (cell.aName.text)!
            
            Globals.global.specialistCallsignSelected = callsign
        }
    }
    
    func fillListItems(){
        specialists = AppData().getSpecialists()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {return cellProperties().basicCellHeightWithImage}
    override func preferredStatusBarStyle() -> UIStatusBarStyle {return UIStatusBarStyle.LightContent}
}