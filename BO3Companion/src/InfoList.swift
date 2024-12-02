//
//  InfoList.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/24/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class InfoList: UITableViewController{
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let view = view as? UITableViewHeaderFooterView {
            
            view.textLabel!.font = UIFont(name: ".SFUIText-Bold", size: 14)
            view.textLabel!.textColor = UIColor.whiteColor()
        }
        
    }
}