//
//  AppData.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/24/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation
import CoreData

class AppData{
 
    // WEAPONS
    
    func getSMGs() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        
        var listOfSMGs = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newWeapon = [String]()
                    
                    if let weaponClass = result.valueForKey("weaponClass") as? String {
                        
                        if (weaponClass == "Sub Machine Gun"){
                            newWeapon.append((result.valueForKey("weaponName") as? String)!)
                            newWeapon.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfSMGs.append(newWeapon)
                        }
                    }
                }
            }
            
        }
        catch {}
        if listOfSMGs.count > 0 {
            return (sortWeaponClass(listOfSMGs))
        }
        return []
    }
    
    func getAssaults() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        
        var listOfAssaults = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newWeapon = [String]()
                    
                    if let weaponClass = result.valueForKey("weaponClass") as? String {
                        
                        if (weaponClass == "Assault Rifle"){
                            newWeapon.append((result.valueForKey("weaponName") as? String)!)
                            newWeapon.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfAssaults.append(newWeapon)
                        }
                    }
                }
            }
            
        }
        catch {}
        if listOfAssaults.count > 0 {
            return (sortWeaponClass(listOfAssaults))
        }
        return []
    }
    
    func getShotguns() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        
        var listOfShotguns = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newWeapon = [String]()
                    
                    if let weaponClass = result.valueForKey("weaponClass") as? String {
                        
                        if (weaponClass == "Shotgun"){
                            newWeapon.append((result.valueForKey("weaponName") as? String)!)
                            newWeapon.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfShotguns.append(newWeapon)
                        }
                    }
                }
            }
            
        }
        catch {}
        if listOfShotguns.count > 0 {
            return (sortWeaponClass(listOfShotguns))
        }
        return []
    }
    
    func getLMGs() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        
        var listOfLMGs = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newWeapon = [String]()
                    
                    if let weaponClass = result.valueForKey("weaponClass") as? String {
                        
                        if (weaponClass == "Light Machine Gun"){
                            newWeapon.append((result.valueForKey("weaponName") as? String)!)
                            newWeapon.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfLMGs.append(newWeapon)
                        }
                    }
                }
            }
            
        }
        catch {}
        if listOfLMGs.count > 0 {
            return (sortWeaponClass(listOfLMGs))
        }
        return []
    }
    
    func getSnipers() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        
        var listOfSnipers = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newWeapon = [String]()
                    
                    if let weaponClass = result.valueForKey("weaponClass") as? String {
                        
                        if (weaponClass == "Sniper Rifle"){
                            newWeapon.append((result.valueForKey("weaponName") as? String)!)
                            newWeapon.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfSnipers.append(newWeapon)
                        }
                    }
                }
            }
            
        }
        catch {}
        
        if listOfSnipers.count > 0 {
            return (sortWeaponClass(listOfSnipers))
        }
        return []
    }
    
    func getPistols() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        
        var listOfPistols = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newWeapon = [String]()
                    
                    if let weaponClass = result.valueForKey("weaponClass") as? String {
                        
                        if (weaponClass == "Pistol"){
                            newWeapon.append((result.valueForKey("weaponName") as? String)!)
                            newWeapon.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfPistols.append(newWeapon)
                        }
                    }
                }
            }
            
        }
        catch {}
        
        if listOfPistols.count > 0 {
            return (sortWeaponClass(listOfPistols))
        }
        return[]
    }
    
    func getLaunchers() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        
        var listOfLaunchers = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newWeapon = [String]()
                    
                    if let weaponClass = result.valueForKey("weaponClass") as? String {
                        
                        if (weaponClass == "Launcher"){
                            newWeapon.append((result.valueForKey("weaponName") as? String)!)
                            newWeapon.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfLaunchers.append(newWeapon)
                        }
                    }
                }
            }
            
        }
        catch {}
        
        if listOfLaunchers.count > 0 {
            return (sortWeaponClass(listOfLaunchers))
        }
        
        return []
    }
    
    func getSpecials() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        
        var listOfSpecials = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newWeapon = [String]()
                    
                    if let weaponClass = result.valueForKey("weaponClass") as? String {
                        
                        if (weaponClass == "Special"){
                            newWeapon.append((result.valueForKey("weaponName") as? String)!)
                            newWeapon.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfSpecials.append(newWeapon)
                        }
                    }
                }
            }
            
        }
        catch {}
        
        if listOfSpecials.count > 0 {
            return (sortWeaponClass(listOfSpecials))
        }
        return[]
    }
    
    func sortWeaponClass( wArray: [[String]]) -> [[String]]{
        
        var weaponNames = [String]()
        var weaponLevels = [Int]()
        
        for gun in wArray{
            weaponNames.append(gun[0])
            let level = Int(gun[1])
            weaponLevels.append(level!)
        }
        
        var didSwap = true
        
        while didSwap {
            didSwap = false
            
            for i in 0..<weaponLevels.count - 1 {
                if weaponLevels[i] > weaponLevels[i+1] {
                    let tmp = weaponLevels[i]
                    let tmp2 = weaponNames[i]
                    
                    weaponLevels[i] = weaponLevels[i+1]
                    weaponNames[i] = weaponNames[i+1]
                    
                    weaponLevels[i+1] = tmp
                    weaponNames[i+1] = tmp2
                    
                    didSwap = true
                }
            }
        }
        
        for var i = 0; i < wArray.count; ++i{
            let weaponLevel = String(weaponLevels[i])
            let tempArray = [weaponNames[i], weaponLevel]
            wArray[i] = tempArray
        }
        
        return wArray
    }
    
    func getWeaponData(name: String) -> (wName: String, wLvl: String, wClass: String, wType: String, wFireMode: String, wDescription: String, wTotalAmmo: String, wMagSize: String, wROF: String, wReload: String, wADS: String, wDamageC: String, wDamageF: String, wPros: String, wCons: String){
        
        var wName = String()
        var wLvl = String()
        var wClass = String()
        var wType = String()
        var wFireMode = String()
        var wDescription = String()
        var wTotalAmmo = String()
        var wMagSize = String()
        var wROF = String()
        var wReload = String()
        var wADS = String()
        var wDamageC = String()
        var wDamageF = String()
        var wPros = String()
        var wCons = String()
        
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "weaponName = %@", name)
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    if let weaponName = result.valueForKey("weaponName") as? String {
                       wName = weaponName
                    }
                    if let weaponLevel = result.valueForKey("lvlAvailable") as? String {
                        wLvl = weaponLevel
                    }
                    if let weaponClass = result.valueForKey("weaponClass") as? String {
                        wClass = weaponClass
                    }
                    if let weaponType = result.valueForKey("weaponType") as? String {
                        wType = weaponType
                    }
                    if let fireMode = result.valueForKey("fireMode") as? String {
                        wFireMode = fireMode
                    }
                    if let weaponDescription = result.valueForKey("weaponDescription") as? String {
                        wDescription = weaponDescription
                    }
                    if let totalAmmo = result.valueForKey("totalAmmo") as? String {
                        wTotalAmmo = totalAmmo
                    }
                    if let magazineSize = result.valueForKey("magazineSize") as? String {
                        wMagSize = magazineSize
                    }
                    if let rof = result.valueForKey("rof") as? String {
                        wROF = rof
                    }
                    if let reloadTime = result.valueForKey("reloadTime") as? String {
                        wReload = reloadTime
                    }
                    if let adsTime = result.valueForKey("adsTime") as? String {
                        wADS = adsTime
                    }
                    if let damageC = result.valueForKey("damageClose") as? String {
                        wDamageC = damageC
                    }
                    if let damageF = result.valueForKey("damageFar") as? String {
                        wDamageF = damageF
                    }
                    if let pros = result.valueForKey("pros") as? String {
                        wPros = pros
                    }
                    if let cons = result.valueForKey("cons") as? String {
                        wCons = cons
                    }
                    
                }
            }
            
        }
        catch {
            print("Could not fetch.")
        }
        
        
        return (wName, wLvl, wClass, wType, wFireMode, wDescription, wTotalAmmo, wMagSize, wROF, wReload, wADS, wDamageC, wDamageF, wPros, wCons)
    }
    
    func getWeaponMainImage(name: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "weaponName = %@", name)
        
        var wImage = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let imageData = results[0].valueForKey("imageData") as? NSData{
                    wImage = UIImage(data: imageData)!
                }
            }
            
        }
        catch {
            print("Could not fetch.")
        }

        return wImage
    }
    
    func getWeaponSquareImage(name: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Weapon")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "weaponName = %@", name)
        
        var wImageSquare = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                print("\(results.count) results for \(name)")
                if let imageSqData = results[0].valueForKey("imageSqData") as? NSData{
                    wImageSquare = UIImage(data: imageSqData)!
                }
            }
        }
        catch {
            print("Could not fetch.")
        }
        return wImageSquare
    }
    
    // PERKS
    
    func getTierOnePerks() -> [[String]]{
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Perk")
        
        request.returnsObjectsAsFaults = false
        
        var listOfPerks = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newPerk = [String]()
                    if let perkTier = result.valueForKey("perkTier") as? String {
                        
                        if (perkTier == "1"){
                            newPerk .append((result.valueForKey("perkName") as? String)!)
                            newPerk.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfPerks.append(newPerk)
                        }
                        
                    }
                }
            }
            
        }
        catch {}
        
        if listOfPerks.count > 0 {
            return (sortWeaponClass(listOfPerks))
        }
        return []
        
    }
    
    func getTierTwoPerks() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Perk")
        
        request.returnsObjectsAsFaults = false
        
        var listOfPerks = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newPerk = [String]()
                    if let perkTier = result.valueForKey("perkTier") as? String {
                        
                        if (perkTier == "2"){
                            newPerk .append((result.valueForKey("perkName") as? String)!)
                            newPerk.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfPerks.append(newPerk)
                        }
                        
                    }
                }
            }
            
        }
        catch {}
        
        if listOfPerks.count > 0 {
            return (sortWeaponClass(listOfPerks))
        }
        return []
    }
    
    func getTierThreePerks() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Perk")
        
        request.returnsObjectsAsFaults = false
        
        var listOfPerks = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newPerk = [String]()
                    if let perkTier = result.valueForKey("perkTier") as? String {
                        
                        if (perkTier == "3"){
                            newPerk .append((result.valueForKey("perkName") as? String)!)
                            newPerk.append((result.valueForKey("lvlAvailable") as? String)!)
                            listOfPerks.append(newPerk)
                        }
                        
                    }
                }
            }
            
        }
        catch {}
        
        if listOfPerks.count > 0 {
            return (sortWeaponClass(listOfPerks))
        }
        return []
    }
    
    func sortPerkTier( pArray: [[String]]) -> [[String]]{
        var perkNames = [String]()
        var perkLevels = [Int]()
        
        for perk in pArray{
            perkNames.append(perk[0])
            let level = Int(perk[1])
            perkLevels.append(level!)
        }
        
        var didSwap = true
        
        while didSwap {
            didSwap = false
            
            for i in 0..<perkLevels.count - 1 {
                if perkLevels[i] > perkLevels[i+1] {
                    let tmp = perkLevels[i]
                    let tmp2 = perkNames[i]
                    
                    perkLevels[i] = perkLevels[i+1]
                    perkNames[i] = perkNames[i+1]
                    
                    perkLevels[i+1] = tmp
                    perkNames[i+1] = tmp2
                    
                    didSwap = true
                }
            }
        }
        
        for var i = 0; i < pArray.count; ++i{
            let perkLevel = String(perkLevels[i])
            let tempArray = [perkNames[i], perkLevel]
            pArray[i] = tempArray
        }
        return pArray
    }
    
    func getPerkData(name: String) -> (pName: String, pLevel: String, pTier: String, pDescription: String, pUses: String){
        
        var pName = String()
        var pLevel = String()
        var pTier = String()
        var pDescription = String()
        var pUses = String()
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Perk")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "perkName = %@", name)
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let perkName = results[0].valueForKey("perkName") as? String {
                    pName = perkName
                }
                if let perkLevel = results[0].valueForKey("lvlAvailable") as? String {
                    pLevel = perkLevel
                }
                if let perkTier = results[0].valueForKey("perkTier") as? String {
                    pTier = perkTier
                }
                if let perkDescription = results[0].valueForKey("perkDescription") as? String {
                    pDescription = perkDescription
                }
                if let uses = results[0].valueForKey("perkUse") as? String {
                    pUses = uses
                }
            }
            
        }
        catch {}
        
        return (pName, pLevel, pTier, pDescription, pUses)
        
    }
    
    func getPerkImage(name: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Perk")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "perkName = %@", name)
        var image = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    if let imageData = result.valueForKey("imageData") as? NSData{
                        image = UIImage(data: imageData)!
                    }
                }
            }
        }catch{}
        return image
    }
    
    // ATTACHMENTS
    
    func getOptics() -> [String]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Attachment")
        
        request.returnsObjectsAsFaults = false
        
        var listOfOptics = [String]()
        do {
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0{
                for result: AnyObject in results{
                    
                    if let type = result.valueForKey("attachmentType") as? String {
                        if (type == "Optic"){
                            
                            listOfOptics.append((result.valueForKey("attachmentName") as? String)!)
                        }
                    }
                }
            }
        }
        catch{}
        
        return listOfOptics
    }
    
    func getAttachments() -> [String]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Attachment")
        
        request.returnsObjectsAsFaults = false
        
        var listOfAttachments = [String]()
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0{
                for result: AnyObject in results{
                    
                    if let type = result.valueForKey("attachmentType") as? String {
                        if (type == "Attachment"){
                            
                            listOfAttachments.append((result.valueForKey("attachmentName") as? String)!)
                        }
                    }
                }
            }
        }
        catch{}
        return listOfAttachments
    }
    
    func getOpticImage(name: String) -> UIImage {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Attachment")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "attachmentName = %@", name)
        
        var opticImage = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let imageData = results[0].valueForKey("imageData") as? NSData{
                    opticImage = UIImage(data: imageData)!
                }
            }
        }
        catch {
            print("Could not fetch.")
        }
        return opticImage
    }
    
    func getAttachmentImage(name: String) -> UIImage {
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Attachment")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "attachmentName = %@", name)
        
        var attachmentImage = UIImage()
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let imageData = results[0].valueForKey("imageData") as? NSData{
                    attachmentImage = UIImage(data: imageData)!
                }
            }
        }
        catch {
            print("Could not fetch.")
        }
        return attachmentImage
    }
    
    func getAttachmentDataByClass(name: String) -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Attachment")
        
        request.returnsObjectsAsFaults = false
        
        var listOfAttachments = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0{
                for result: AnyObject in results{
                    
                    var newAttachment = [String]()
                    
                    if let availableFor = result.valueForKey("lvlAvailable\(name)") as? String {
                        if (availableFor != "-1"){
                            
                            newAttachment.append((result.valueForKey("attachmentName") as? String)!)
                            newAttachment.append((result.valueForKey("lvlAvailable\(name)") as? String)!)
                            newAttachment.append((result.valueForKey("attachmentType") as? String)!)
                            newAttachment.append((result.valueForKey("attachmentDescription") as? String)!)
                            listOfAttachments.append(newAttachment)
                            
                        }
                    }
                }
            }
            
        }
        catch {
            print("Could not fetch.")
        }
        
        
        if listOfAttachments.count > 0 {
            return (sortAttachments(listOfAttachments))
        }
        
        return []
    }
    
    func getAttachmentByName(name: String) -> (aName: String, aType: String, aDescription: String, aLvlSMG: String, aLvlAssault: String, aLvlShotgun: String, aLvlLMG: String, aLvlSniper: String, aLvlPistol: String){
        
        var aName = String()
        var aType = String()
        var aDescription = String()
        var aLvlSMG = String()
        var aLvlAssault = String()
        var aLvlShotgun = String()
        var aLvlLMG = String()
        var aLvlSniper = String()
        var aLvlPistol = String()
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Attachment")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "attachmentName = %@", name)
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let attachmentName = results[0].valueForKey("attachmentName") as? String {
                    aName = attachmentName
                }
                if let attachmentType = results[0].valueForKey("attachmentType") as? String {
                    aType = attachmentType
                }
                if let attachmentDescription = results[0].valueForKey("attachmentDescription") as? String {
                    aDescription = attachmentDescription
                }
                if let lvlSMG = results[0].valueForKey("lvlAvailableSmg") as? String {
                    if lvlSMG != "-1"{
                        aLvlSMG = lvlSMG
                    } else {
                        aLvlSMG = "N/A"
                    }
                }
                if let lvlAssault = results[0].valueForKey("lvlAvailableAssaultrifle") as? String {
                    if lvlAssault != "-1"{
                        aLvlAssault = lvlAssault
                    } else {
                        aLvlAssault = "N/A"
                    }
                }
                if let lvlShotgun = results[0].valueForKey("lvlAvailableShotgun") as? String {
                    if lvlShotgun != "-1"{
                        aLvlShotgun = lvlShotgun
                    } else {
                        aLvlShotgun = "N/A"
                    }
                }
                if let lvlLMG = results[0].valueForKey("lvlAvailableLmg") as? String {
                    if lvlLMG != "-1"{
                        aLvlLMG = lvlLMG
                    } else {
                        aLvlLMG = "N/A"
                    }
                }
                if let lvlSniper = results[0].valueForKey("lvlAvailableSniper") as? String {
                    if lvlSniper != "-1"{
                        aLvlSniper = lvlSniper
                    } else {
                        aLvlSniper = "N/A"
                    }
                }
                if let lvlPistol = results[0].valueForKey("lvlAvailablePistol") as? String {
                    if lvlPistol != "-1"{
                        aLvlPistol = lvlPistol
                    } else {
                        aLvlPistol = "N/A"
                    }
                }
                
            }
            
        }
        catch {}
        return (aName, aType, aDescription, aLvlSMG, aLvlAssault, aLvlShotgun, aLvlLMG, aLvlSniper, aLvlPistol)
    }
    
    func sortAttachments( aArray: [[String]]) -> [[String]]{
        var aNames = [String]()
        var aLevels = [Int]()
        var aTypes = [String]()
        var aDescriptions = [String]()
        
        for attachment in aArray{
            aNames.append(attachment[0])
            let level = Int(attachment[1])
            aLevels.append(level!)
            aTypes.append(attachment[2])
            aDescriptions.append(attachment[3])
        }
        
        var didSwap = true
        
        while didSwap {
            didSwap = false
            
            for i in 0..<aLevels.count - 1 {
                
                if aLevels[i] > aLevels[i+1] {
                    
                    let tmp = aLevels[i]
                    let tmp2 = aNames[i]
                    let tmp3 = aTypes[i]
                    let tmp4 = aDescriptions[i]
                    
                    aLevels[i] = aLevels[i+1]
                    aNames[i] = aNames[i+1]
                    aTypes[i] = aTypes[i+1]
                    aDescriptions[i] = aDescriptions[i+1]
                    
                    aLevels[i+1] = tmp
                    aNames[i+1] = tmp2
                    aTypes[i+1] = tmp3
                    aDescriptions[i+1] = tmp4
                    
                    
                    didSwap = true
                }
            }
        }
        
        for var i = 0; i < aArray.count; ++i{
            let attachmentLevel = String(aLevels[i])
            let tempArray = [aNames[i], attachmentLevel, aTypes[i], aDescriptions[i]]
            aArray[i] = tempArray
        }
        return aArray
    }
    
    // EQUIPMENT
    
    func getLethals() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Lethal")
        
        request.returnsObjectsAsFaults = false
        
        var listOfLethals = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newLethal = [String]()
                    newLethal.append((result.valueForKey("lethalName") as? String)!)
                    newLethal.append((result.valueForKey("lvlAvailable") as? String)!)
                    listOfLethals.append(newLethal)
                }
            }
            
        }
        catch {}
        
        if listOfLethals.count > 0 {
            return (sortEquipment(listOfLethals))
        }
        return []
    }
    
    func getTacticals() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Tactical")
        
        request.returnsObjectsAsFaults = false
        
        var listOfTacticals = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newTactical = [String]()
                    newTactical .append((result.valueForKey("tacticalName") as? String)!)
                    newTactical.append((result.valueForKey("lvlAvailable") as? String)!)
                    listOfTacticals.append(newTactical)
                }
            }
            
        }
        catch {}
        
        if listOfTacticals.count > 0 {
            return (sortEquipment(listOfTacticals))
        }
        return []

    }
    
    func sortEquipment( eArray: [[String]]) -> [[String]]{
        var equipmentNames = [String]()
        var equipmentLevels = [Int]()
        
        for equipment in eArray{
            equipmentNames.append(equipment[0])
            let level = Int(equipment[1])
            equipmentLevels.append(level!)
        }
        
        var didSwap = true
        
        while didSwap {
            didSwap = false
            
            for i in 0..<equipmentLevels.count - 1 {
                if equipmentLevels[i] > equipmentLevels[i+1] {
                    let tmp = equipmentLevels[i]
                    let tmp2 = equipmentNames[i]
                    
                    equipmentLevels[i] = equipmentLevels[i+1]
                    equipmentNames[i] = equipmentNames[i+1]
                    
                    equipmentLevels[i+1] = tmp
                    equipmentNames[i+1] = tmp2
                    
                    didSwap = true
                }
            }
        }
        
        for var i = 0; i < eArray.count; ++i{
            let equipmentLevel = String(equipmentLevels[i])
            let tempArray = [equipmentNames[i], equipmentLevel]
            eArray[i] = tempArray
        }
        return eArray
    }
    
    func getLethalData(name: String) -> (eName: String, eLevel: String, eDescription: String, eUsage: String){
        
        var eName = String()
        var eLevel = String()
        var eDescription = String()
        var eUsage = String()
        
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Lethal")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "lethalName = %@", name)
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let lethalName = results[0].valueForKey("lethalName") as? String {
                    eName = lethalName
                }
                if let lethalLevel = results[0].valueForKey("lvlAvailable") as? String {
                    eLevel = lethalLevel
                }
                if let lethalDescription = results[0].valueForKey("lethalDescription") as? String {
                    eDescription = lethalDescription
                }
                if let usage = results[0].valueForKey("lethalUsage") as? String {
                    eUsage = usage
                }
            }
            
        }
        catch {}
        
        return (eName, eLevel, eDescription, eUsage)
    }
    
    func getTacticalData(name: String)  -> (eName: String, eLevel: String, eDescription: String, eUsage: String){
        
        var eName = String()
        var eLevel = String()
        var eDescription = String()
        var eUsage = String()
        
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Tactical")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "tacticalName = %@", name)
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let tacticalName = results[0].valueForKey("tacticalName") as? String {
                    eName = tacticalName
                }
                if let tacticalLevel = results[0].valueForKey("lvlAvailable") as? String {
                    eLevel = tacticalLevel
                }
                if let tacticalDescription = results[0].valueForKey("tacticalDescription") as? String {
                    eDescription = tacticalDescription
                }
                if let usage = results[0].valueForKey("tacticalUsage") as? String {
                    eUsage = usage
                }
            }
            
        }
        catch {}
        
        return (eName, eLevel, eDescription, eUsage)
    }
    
    func getLethalImage(name: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Lethal")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "lethalName = %@", name)
        
        var lethalImage = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let imageData = results[0].valueForKey("imageData") as? NSData{
                    lethalImage = UIImage(data: imageData)!
                }
            }
        }
        catch {
            print("Could not fetch.")
        }
        return lethalImage
    }
    
    func getTacticalImage(name: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Tactical")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "tacticalName = %@", name)
        
        var tacticalImage = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let imageData = results[0].valueForKey("imageData") as? NSData{
                    tacticalImage = UIImage(data: imageData)!
                }
            }
        }
        catch {
            print("Could not fetch.")
        }
        return tacticalImage
    }
    
    func getEquipmentImage(name: String) -> UIImage{
        
        var equipmentImage = getLethalImage(name)
        if equipmentImage.size == CGSize(width: 0, height: 0){
            equipmentImage = getTacticalImage(name)
        }
        
        return equipmentImage
    }
    
    // SCORESTREAKS
    
    func getScorestreaks() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Scorestreak")
        
        request.returnsObjectsAsFaults = false
        
        var listOfScorestreaks = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newLethal = [String]()
                    newLethal.append((result.valueForKey("scorestreakName") as? String)!)
                    newLethal.append((result.valueForKey("lvlAvailable") as? String)!)
                    listOfScorestreaks.append(newLethal)
                }
            }
            
        }
        catch {}
        
        if listOfScorestreaks.count > 0 {
            return (sortScorestreaks(listOfScorestreaks))
        }
        return []
    }
    
    func getScorestreakData(name: String) -> (sName: String, sLevel: String, sPoints: String, sDescription: String){
        
        var sName = String()
        var sLevel = String()
        var sPoints = String()
        var sDescription = String()
        
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Scorestreak")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "scorestreakName = %@", name)
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let scorestreakName = results[0].valueForKey("scorestreakName") as? String {
                    sName = scorestreakName
                }
                if let scorestreakLevel = results[0].valueForKey("lvlAvailable") as? String {
                    sLevel = scorestreakLevel
                }
                if let scorestreakPoints = results[0].valueForKey("scorestreakPoints") as? String {
                    sPoints = scorestreakPoints
                }
                if let scorestreakDescription = results[0].valueForKey("scorestreakDescription") as? String {
                    sDescription = scorestreakDescription
                }
            }
            
        }
        catch {}
        
        return (sName, sLevel, sPoints, sDescription)
    }
    
    func sortScorestreaks( sArray: [[String]]) -> [[String]]{
        var scorestreakNames = [String]()
        var scorestreakLevels = [Int]()
        
        for scorestreak in sArray{
            scorestreakNames.append(scorestreak[0])
            let level = Int(scorestreak[1])
            scorestreakLevels.append(level!)
        }
        
        var didSwap = true
        
        while didSwap {
            didSwap = false
            
            for i in 0..<scorestreakLevels.count - 1 {
                if scorestreakLevels[i] > scorestreakLevels[i+1] {
                    let tmp = scorestreakLevels[i]
                    let tmp2 = scorestreakNames[i]
                    
                    scorestreakLevels[i] = scorestreakLevels[i+1]
                    scorestreakNames[i] = scorestreakNames[i+1]
                    
                    scorestreakLevels[i+1] = tmp
                    scorestreakNames[i+1] = tmp2
                    
                    didSwap = true
                }
            }
        }
        
        for var i = 0; i < sArray.count; ++i{
            let scorestreakLevel = String(scorestreakLevels[i])
            let tempArray = [scorestreakNames[i], scorestreakLevel]
            sArray[i] = tempArray
        }
        return sArray
    }
    
    func getScorestreakImage(name: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Scorestreak")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "scorestreakName = %@", name)
        
        var scorestreakImage = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let imageData = results[0].valueForKey("imageData") as? NSData{
                    scorestreakImage = UIImage(data: imageData)!
                }
            }
        }
        catch {
            print("Could not fetch.")
        }
        return scorestreakImage
    }
    
    // SPECIALISTS
    
    func getSpecialists() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Specialist")
        
        request.returnsObjectsAsFaults = false
        
        var listOfSpecialists = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newLethal = [String]()
                    newLethal.append((result.valueForKey("specialistCallsign") as? String)!)
                    newLethal.append((result.valueForKey("lvlAvailable") as? String)!)
                    listOfSpecialists.append(newLethal)
                }
            }
            
        }
        catch {}
        
        if listOfSpecialists.count > 0 {
            return (sortSpecialists(listOfSpecialists))
        }
        return []
    }
    
    func sortSpecialists( sArray: [[String]]) -> [[String]]{
        var specialistNames = [String]()
        var specialistLevels = [Int]()
        
        for specialist in sArray{
            specialistNames.append(specialist[0])
            let level = Int(specialist[1])
            specialistLevels.append(level!)
        }
        
        var didSwap = true
        
        while didSwap {
            didSwap = false
            
            for i in 0..<specialistLevels.count - 1 {
                if specialistLevels[i] > specialistLevels[i+1] {
                    let tmp = specialistLevels[i]
                    let tmp2 = specialistNames[i]
                    
                    specialistLevels[i] = specialistLevels[i+1]
                    specialistNames[i] = specialistNames[i+1]
                    
                    specialistLevels[i+1] = tmp
                    specialistNames[i+1] = tmp2
                    
                    didSwap = true
                }
            }
        }
        
        for var i = 0; i < sArray.count; ++i{
            let specialistLevel = String(specialistLevels[i])
            let tempArray = [specialistNames[i], specialistLevel]
            sArray[i] = tempArray
        }
        return sArray
    }
    
    func getSpecialistData(name: String) -> (sName: String, sPWName: String, sAbilityName: String, sCallsign: String, sLevel: String, sDescription: String, sPWDescription: String, sAbilityDescription: String){
        
        var sName = String()
        var sPWName = String()
        var sAbilityName = String()
        var sCallsign = String()
        var sLevel = String()
        var sDescription = String()
        var sPWDescription = String()
        var sAbilityDescription = String()
        
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Specialist")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "specialistCallsign = %@", name)
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if let specialistName = results[0].valueForKey("specialistName") as? String {
                    sName = specialistName
                }
                if let specialistPWName = results[0].valueForKey("specialistPWName") as? String{
                    sPWName = specialistPWName
                }
                if let specialistAbilityName = results[0].valueForKey("specialistAbilityName") as? String{
                    sAbilityName = specialistAbilityName
                }
                if let specialistCallsign = results[0].valueForKey("specialistCallsign") as? String{
                    sCallsign = specialistCallsign
                }
                if let specialistLevel = results[0].valueForKey("lvlAvailable") as? String{
                    sLevel = specialistLevel
                }
                if let specialistDescription = results[0].valueForKey("specialistDescription") as? String{
                    sDescription = specialistDescription
                }
                if let specialistPWDescription = results[0].valueForKey("specialistPWDescription") as? String{
                    sPWDescription = specialistPWDescription
                }
                if let specialistAbilityDescription = results[0].valueForKey("specialistAbilityDescription") as? String{
                    sAbilityDescription = specialistAbilityDescription
                }
            }
            
        }
        catch {}
        return (sName, sPWName, sAbilityName, sCallsign, sLevel, sDescription, sPWDescription, sAbilityDescription)
    }
    
    func getSpecialistMainImage(name: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Specialist")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "specialistCallsign = %@", name)
        var image = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    if let imageData = result.valueForKey("imageData") as? NSData{
                        image = UIImage(data: imageData)!
                    }
                }
            }
        }catch{}
        return image
    }
    
    func getSpecialistPWImage(name: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Specialist")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "specialistCallsign = %@", name)
        var image = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    if let imageData = result.valueForKey("imagePWData") as? NSData{
                        image = UIImage(data: imageData)!
                    }
                }
            }
        }catch{}
        return image
    }
    
    func getSpecialistAbilityImage(name: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Specialist")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "specialistCallsign = %@", name)
        var image = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    if let imageData = result.valueForKey("imageAbilityData") as? NSData{
                        image = UIImage(data: imageData)!
                    }
                }
            }
        }catch{}
        return image
    }
    
    // Multplayer Maps
    
    func getMultiMaps() -> [[String]]{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Map")
        
        request.returnsObjectsAsFaults = false
        
        var listOfMaps = [[String]]()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    var newMap = [String]()
                    newMap.append((result.valueForKey("mapName") as? String)!)
                    newMap.append((result.valueForKey("isDLC") as? String)!)
                    listOfMaps.append(newMap)
                }
            }
            
        }
        catch {}
        
        return listOfMaps
    }
    
    func getCoreMapData(name: String) -> (mName: String, mLoc: String, mDesc: String){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Map")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "mapName = %@", name)
        var mapName = String()
        var mapLoc = String()
        var mapDesc = String()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                mapName = ((results[0].valueForKey("mapName") as? String)!)
                mapLoc = ((results[0].valueForKey("mapLoc") as? String)!)
                mapDesc = ((results[0].valueForKey("mapDesc") as? String)!)
            }
            
        }
        catch {}
        
        
        return (mapName, mapLoc, mapDesc)
    }
    
    func getDLCMapData(name: String) -> (mName: String, mLoc: String, mDesc: String, mDLC: String){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Map")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "mapName = %@", name)
        
        var mapName = String()
        var mapLoc = String()
        var mapDesc = String()
        var mapDLC = String()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                mapName = ((results[0].valueForKey("mapName") as? String)!)
                mapLoc = ((results[0].valueForKey("mapLoc") as? String)!)
                mapDesc = ((results[0].valueForKey("mapDesc") as? String)!)
                mapDLC = ((results[0].valueForKey("dlcName") as? String)!)
            }
            
        }
        catch {}
        
        
        return (mapName, mapLoc, mapDesc, mapDLC)
    }
    
    func getMapImage(name: String, type: String) -> UIImage{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Map")
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "mapName = %@", name)
        var image = UIImage()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                if type == "main"{
                    image  = UIImage(data: (results[0].valueForKey("imageData") as? NSData)!)!
                } else if type == "Basic" {
                    image  = UIImage(data: (results[0].valueForKey("imageBasicData") as? NSData)!)!
                } else if type == "SND" {
                    image  = UIImage(data: (results[0].valueForKey("imageSNDData") as? NSData)!)!
                } else if type == "Dom" {
                    image  = UIImage(data: (results[0].valueForKey("imageDomData") as? NSData)!)!
                } else if type == "Uplink" {
                    image  = UIImage(data: (results[0].valueForKey("imageUplinkData") as? NSData)!)!
                } else if type == "Demo" {
                    image  = UIImage(data: (results[0].valueForKey("imageDemoData") as? NSData)!)!
                }
                
            } else {
                print("no map found")
            }
        }catch{}
        return image
    }
    
    // Created Classes
    
    func saveClass(){
        
    }
    
    func getClassData(){
        
    }
    
    func getClassList(){
        
    }

    // Messages
    func getHomeNewInCod() -> String{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Messages")
        
        var message = String()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    if let msg = result.valueForKey("homeNewInCod") as? String{
                        message = msg
                    }
                }
            }
        }catch{}
        return message
    }
    
    func getHomeMessageOfDay() -> String{
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: "Messages")
        
        var message = String()
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                for result: AnyObject in results{
                    if let msg = result.valueForKey("homeMessageOfDay") as? String{
                        message = msg
                    }
                }
            }
        }catch{}
        return message
    }
    
}