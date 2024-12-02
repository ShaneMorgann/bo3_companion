//
//  CACListMainPickList.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/30/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class CACMainPickList: UITableViewController{
    
    var itemList = [String : String]()
    
    @IBOutlet var pWeapon: UILabel!
    @IBOutlet var pOptic: UILabel!
    @IBOutlet var pAttOne: UILabel!
    @IBOutlet var pAttTwo: UILabel!
    @IBOutlet var pAttThree: UILabel!
    @IBOutlet var pAttFour: UILabel!
    @IBOutlet var pAttFive: UILabel!
    
    @IBOutlet var sWeapon: UILabel!
    @IBOutlet var sOptic: UILabel!
    @IBOutlet var sAttOne: UILabel!
    @IBOutlet var sAttTwo: UILabel!
    
    @IBOutlet var perkOne: UILabel!
    @IBOutlet var perkOneG: UILabel!
    @IBOutlet var perkTwo: UILabel!
    @IBOutlet var perkTwoG: UILabel!
    @IBOutlet var perkThree: UILabel!
    @IBOutlet var perkThreeG: UILabel!
    
    @IBOutlet var lethal: UILabel!
    @IBOutlet var tactical: UILabel!
    
    @IBOutlet var wcOne: UILabel!
    @IBOutlet var wcTwo: UILabel!
    @IBOutlet var wcThree: UILabel!
    
    
    
    override func viewDidLoad() {
        Globals.global.resetCACList()
        setListValues()
    }
    
    override func viewWillAppear(animated: Bool) {
        if Globals.global.editingClass{
            setValueForKey(Globals.global.cacSetValue, key: Globals.global.cacSegueID)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if !(segue.identifier == "back"){
            let destVC = segue.destinationViewController as! CACPickItem
            destVC.identifier = segue.identifier!
            Globals.global.editingClass = true
            tableView.selectRowAtIndexPath(nil, animated: false, scrollPosition: UITableViewScrollPosition.Top)
        } else {
            Globals.global.editingClass = false
            Globals.global.resetCACList()
        }
    }
    
    func setListValues(){
        itemList = Globals.global.cacList
        pWeapon.text = itemList["cacPWeapon"]
        pOptic.text = itemList["cacPOptic"]
        pAttOne.text = itemList["cacPAtt1"]
        pAttTwo.text = itemList["cacPAtt2"]
        pAttThree.text = itemList["cacPAtt3"]
        pAttFour.text = itemList["cacPAtt4"]
        pAttFive.text = itemList["cacPAtt5"]
        
        sWeapon.text = itemList["cacSWeapon"]
        sOptic.text = itemList["cacSOptic"]
        sAttOne.text = itemList["cacSAtt1"]
        sAttTwo.text = itemList["cacSAtt2"]
        
        perkOne.text = itemList["cacPerk1"]
        perkOneG.text = itemList["cacPerk1G"]
        perkTwo.text = itemList["cacPerk2"]
        perkTwoG.text = itemList["cacPerk2G"]
        perkThree.text = itemList["cacPerk3"]
        perkThreeG.text = itemList["cacPerk3G"]
        
        lethal.text = itemList["cacLethal"]
        if itemList["lethalx2"] == "true"{
            lethal.text?.appendContentsOf(" x2")
        }
        tactical.text = itemList["cacTactical"]
        if itemList["tactiaclx2"] == "true"{
            tactical.text?.appendContentsOf(" x2")
        }
        wcOne.text = itemList["cacWC1"]
        wcTwo.text = itemList["cacWC2"]
        wcThree.text = itemList["cacWC3"]
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        
        if identifier == "cacPOptic" {
            if itemList["cacPWeapon"]! == "none" {
                let indexPath = NSIndexPath(forRow: 1, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacPAtt1"{
            if itemList["cacPWeapon"]! == "none" {
                let indexPath = NSIndexPath(forRow: 2, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacPAtt2"{
            if itemList["cacPWeapon"]! == "none" {
                let indexPath = NSIndexPath(forRow: 3, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt1"]! == "none"{
                let indexPath = NSIndexPath(forRow: 3, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacPAtt3"{
            if itemList["cacPWeapon"]! == "none" {
                let indexPath = NSIndexPath(forRow: 4, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt1"]! == "none"{
                let indexPath = NSIndexPath(forRow: 4, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt2"]! == "none"{
                let indexPath = NSIndexPath(forRow: 4, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacPAtt4"{
            if itemList["cacPWeapon"]! == "none" {
                let indexPath = NSIndexPath(forRow: 5, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt1"]! == "none"{
                let indexPath = NSIndexPath(forRow: 5, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt2"]! == "none"{
                let indexPath = NSIndexPath(forRow: 5, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt3"]! == "none"{
                let indexPath = NSIndexPath(forRow: 5, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacPAtt5"{
            if itemList["cacPWeapon"]! == "none" {
                let indexPath = NSIndexPath(forRow: 6, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt1"]! == "none"{
                let indexPath = NSIndexPath(forRow: 6, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt2"]! == "none"{
                let indexPath = NSIndexPath(forRow: 6, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt3"]! == "none"{
                let indexPath = NSIndexPath(forRow: 6, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacPAtt4"]! == "none"{
                let indexPath = NSIndexPath(forRow: 6, inSection: 0)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacSOptic"{
            if itemList["cacSWeapon"]! == "none" {
                let indexPath = NSIndexPath(forRow: 1, inSection: 1)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacSAtt1"{
            if itemList["cacSWeapon"]! == "none" {
                let indexPath = NSIndexPath(forRow: 2, inSection: 1)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacSAtt1"]! == "none"{
                let indexPath = NSIndexPath(forRow: 2, inSection: 1)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacSAtt2"{
            if itemList["cacSWeapon"]! == "none" {
                let indexPath = NSIndexPath(forRow: 3, inSection: 1)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacSAtt1"]! == "none"{
                let indexPath = NSIndexPath(forRow: 3, inSection: 1)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            } else if itemList["cacSAtt2"]! == "none"{
                let indexPath = NSIndexPath(forRow: 3, inSection: 1)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacPerk1G"{
            if itemList["cacPerk1"]! == "none"{
                let indexPath = NSIndexPath(forRow: 1, inSection: 2)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacPerk2G"{
            if itemList["cacPerk2"]! == "none"{
                let indexPath = NSIndexPath(forRow: 1, inSection: 3)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        } else if identifier == "cacPerk3G"{
            if itemList["cacPerk3"]! == "none"{
                let indexPath = NSIndexPath(forRow: 1, inSection: 4)
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
                return false
            }
        }
        return true
    }
    
    func setValueForKey(value: String, key: String){
        itemList[key] = value
        if key == "cacPWeapon"{
            if itemList[key] != Globals.global.cacList[key]{
                itemList["cacPOptic"] = "none"
                itemList["cacPAtt1"] = "none"
                itemList["cacPAtt2"] = "none"
                itemList["cacPAtt3"] = "none"
                itemList["cacPAtt4"] = "none"
                itemList["cacPAtt5"] = "none"
            }
        } else if key == "cacPAtt1"{
            if value == "none"{
                itemList["cacPAtt1"] = itemList["cacPAtt2"]
                itemList["cacPAtt2"] = itemList["cacPAtt3"]
                itemList["cacPAtt3"] = itemList["cacPAtt4"]
                itemList["cacPAtt4"] = itemList["cacPAtt5"]
                itemList["cacPAtt5"] = "none"
            }
        }
        else if key == "cacPAtt2"{
            if value == "none"{
                itemList["cacPAtt2"] = itemList["cacPAtt3"]
                itemList["cacPAtt3"] = itemList["cacPAtt4"]
                itemList["cacPAtt4"] = itemList["cacPAtt5"]
                itemList["cacPAtt5"] = "none"
            }
        }
        else if key == "cacPAtt3"{
            if value == "none"{
                itemList["cacPAtt3"] = itemList["cacPAtt4"]
                itemList["cacPAtt4"] = itemList["cacPAtt5"]
                itemList["cacPAtt5"] = "none"
            }
        }
        else if key == "cacPAtt4"{
            if value == "none"{
                itemList["cacPAtt4"] = itemList["cacPAtt5"]
                itemList["cacPAtt5"] = "none"
            }
        } else if key == "cacPerk1"{
            if value == "none"{
                itemList["cacPerk1"] = itemList["cacPerk1G"]
                itemList["cacPerk1G"] = "none"
            }
        } else if key == "cacPerk2"{
            if value == "none"{
                itemList["cacPerk2"] = itemList["cacPerk2G"]
                itemList["cacPerk2G"] = "none"
            }
        } else if key == "cacPerk3"{
            if value == "none"{
                itemList["cacPerk3"] = itemList["cacPerk3G"]
                itemList["cacPerk3G"] = "none"
            }
        }
        
        if Globals.global.cacList["lethalx2"] == "true"{
            itemList["lethalx2"] = "true"
        }
        
        if Globals.global.cacList["tacticalx2"] == "true"{
            itemList["tacticalx2"] = "true"
        }
        Globals.global.cacList = itemList
        setListValues()
    }
}