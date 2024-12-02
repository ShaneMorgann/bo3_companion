//
//  Downloader.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/16/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

import CoreData
import Alamofire
import SwiftyJSON


class Downloader: NSObject, NSURLConnectionDataDelegate{
    
    static let downloader = Downloader()
    
    func connection(connection: NSURLConnection, willCacheResponse cachedResponse: NSCachedURLResponse) -> NSCachedURLResponse?
    {
        return nil // never cache anything. ever.
    }
    
    //######################################//
    //              Constants               //
    //######################################//
    
    // Data Paths
    //========================================
    
    let mainPath = ("http://www.shanemorgan.me/BO3_Companion/")
    
    let metaInfo = ("http://www.shanemorgan.me/BO3_Companion/meta/metaInfo.txt")
    
    let mainMessagesPath = ("http://www.shanemorgan.me/BO3_Companion/meta/mainScreen/day")
    let mainScreenInfo = ("http://www.shanemorgan.me/BO3_Companion/meta/mainScreen/mainScreen")
    
    // Default Images
    //========================================
    
    let defaultImage: NSData = UIImageJPEGRepresentation(UIImage(named: "Blackops3Logo.jpg")!, 1.0)!
    let defaultWeaponImage: NSData = UIImageJPEGRepresentation(UIImage(named: "imageNotFound.jpeg")!, 1.0)!
    
    // User Info
    //========================================
    
    // Current user version
    let appVersion = NSUserDefaults.standardUserDefaults().integerForKey("appVersion")
    
    // Download images with files
    let downloadImages = true//NSUserDefaults.standardUserDefaults().boolForKey("downloadImages")
    
    // Day to display information from
    var day = NSUserDefaults.standardUserDefaults().integerForKey("day")
    
    var appStoreVersion = Double()
    
    
    //######################################//
    //              Variables               //
    //######################################//
    
    // Manifest Data (JSON)
    //========================================
    var manifestData:JSON = []
    var manifestVersion = Int()
    
    // File Data (JSON)
    //========================================
    var addFileData:[JSON] = []
    var updateFileData:[JSON] = []
    
    // Image Paths
    //========================================
    var addImagePaths = [String]()
    var updateImagePaths = [String]()
    
    // Image Data and File Name
    //========================================
    var addImageData = [NSData]()
    var addImageName = [String]()
    var updateImageData = [NSData]()
    var updateImageName = [String]()
    
    //######################################//
    //              Functions               //
    //######################################//
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //         DOWNLOAD DELEGATOR           //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    func downloadDelegator(lastAction: String){
        
        if (lastAction.isEmpty){
            sendUpdateMessage("Update Initiated")
            print("-----------------------")
            getMetaData(false)
        }
        else if (lastAction == "metadata"){
            sendUpdateMessage("Retrieved manifest")
            print("-----------------------")
            checkForUpdate()
        }
        else if(lastAction == "Manifest data"){
            sendUpdateMessage("Update available")
            print("-----------------------")
            getFileData("add", index: 0)
        }
        else if(lastAction == "Yes Update"){
            sendUpdateMessage("Update Initiated")
            print("-----------------------")
            getManifest()
        }
        else if(lastAction == "No Update"){
             sendUpdateMessage("No update needed")
        }
        else if(lastAction == "File Data"){
            sendUpdateMessage("Retrieved all required files")
            print("-----------------------")
            getImagePaths()
        }
        else if(lastAction == "Image Paths"){
            sendUpdateMessage("Downloading Images")
            print("-----------------------")
            getImageData("add", index: 0)
        }
        else if (lastAction == "Image Data"){
            sendUpdateMessage("Downloaded all image data")
            print("-----------------------")
            sendUpdateMessage("Done with save operation")
            print("-----------------------")
            print("Done")
            sendUpdateMessage("Update operation completed")
            
            NSUserDefaults.standardUserDefaults().setValue(manifestVersion, forKeyPath: "appVersion")
            //////////////////////////////////////////
            //           Reset Variables            //
            //////////////////////////////////////////
            
            // Manifest Data
            //========================================
            manifestData = nil
            manifestVersion = Int()
            
            // File Data (JSON)
            //========================================
            addFileData = [nil]
            updateFileData = [nil]
            
            // Image Paths
            //========================================
            addImagePaths = [String]()
            updateImagePaths = [String]()
            
            // Image Data and File Name
            //========================================
            addImageData = [NSData]()
            addImageName = [String]()
            updateImageData = [NSData]()
            updateImageName = [String]()
        }
    }
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //             Get Manifest             //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    func getMetaData(onlySetData: Bool){
        let filePath = NSURL(string: metaInfo)
        let url = NSMutableURLRequest(URL: filePath!)
        url.cachePolicy = .ReloadIgnoringLocalCacheData
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        NSURLCache.sharedURLCache().diskCapacity = 0
        NSURLCache.sharedURLCache().memoryCapacity = 0
        Alamofire.request(url).responseJSON
            {result in
                if (result.response?.statusCode != nil){
                    if (result.response?.statusCode)! == 200{
                        
                        let jsonData = JSON(data: result.data!)
                        
                        self.manifestVersion = Int(jsonData["manifestVersion"].stringValue)!
                        NSUserDefaults.standardUserDefaults().setValue(Int(jsonData["day"].stringValue)!, forKeyPath: "day")
                        self.appStoreVersion = Double(jsonData["appStoreVersion"].stringValue)!
                        print("Set the version of the app to: \(self.appStoreVersion)");
                        
                        print("Retrieved Meta data")
                        if !onlySetData{
                            self.downloadDelegator("metadata")
                        }
                        print(jsonData);
                    } else {
                        self.sendUpdateMessage("Could not connect to update servers. metadata")
                        print("A connection could not be established to the update server")
                        print("Unable to download meta data")
                    }
                } else {
                    self.sendUpdateMessage("Could not connect to update servers. Stop 1")
                }
        }
    }
    
    var manifestURL = ("http://www.shanemorgan.me/BO3_Companion/meta/manifests/v")
    func getManifest(){
        print("Retreiving manifest")
        let filePath = NSURL(string: ("\(manifestURL)\(manifestVersion)/appVersion\(appVersion).txt"))
        print("Manifest Path: \(filePath!)")
        let url = NSMutableURLRequest(URL: filePath!)
        url.cachePolicy = .ReloadIgnoringLocalCacheData
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        NSURLCache.sharedURLCache().diskCapacity = 0
        NSURLCache.sharedURLCache().memoryCapacity = 0
        
        Alamofire.request(url).responseJSON
            {result in
                if (result.response?.statusCode != nil){
                    if (result.response?.statusCode)! == 200{
                    
                    let jsonData = JSON(data: result.data!)
                    self.manifestData = jsonData
                    print("Retrieved Manifest")
                    self.downloadDelegator("Manifest data")
                    
                    } else {
                        self.sendUpdateMessage("Could not connect to update servers.")
                        print("A connection could not be established to the update server")
                        print("Unable to download manifest data")
                    }
                } else {
                    self.sendUpdateMessage("Could not connect to update servers.")
                }
            }
    }
    
    //
    // Checks if update process should continue
    //
    func checkForUpdate(){
        var needsUpdated = false
        if appVersion < manifestVersion{
            needsUpdated = true
        }
        
        if (needsUpdated){
            downloadDelegator("Yes Update")
        } else{
            downloadDelegator("No Update")
            
        }
    }
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //             Download File            //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    func downloadFile(path: String, index: Int, type: String){
        var filePath = NSURL(string: "")
        if type == "add" || type == "update"{
            filePath = NSURL(string: "\(mainPath)\(path).txt")!
        }
        else if (type == "mainscreen"){
            filePath = NSURL(string: ("\(mainMessagesPath)\(day)/mainScreenMessages.txt"))!

        }
        
        let url = NSMutableURLRequest(URL: filePath!)
        url.cachePolicy = .ReloadIgnoringLocalCacheData
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        NSURLCache.sharedURLCache().diskCapacity = 0
        NSURLCache.sharedURLCache().memoryCapacity = 0
        
        Alamofire.request(url).responseJSON
            {result in
                
                if (result.response?.statusCode != nil){
                    if (result.response?.statusCode)! == 200
                    {
                        let jsonData = JSON(data: result.data!)
                        if (type == "add")
                        {
                            self.addFileData.append(jsonData)
                            print("Finished with ADD file: \(path)")
                            self.getFileData("add", index: index + 1)
                        }
                        else if (type == "update")
                        {
                            self.updateFileData.append(jsonData)
                            print("Finished with UPDATE file: \(path)")
                            self.getFileData("update", index: index + 1)
                        }
                        else if (type == "mainscreen")
                        {
                            for (_,subJson):(String, JSON) in jsonData["newInCod"] {
                                self.newInCod.append(subJson.stringValue)
                            }
                            for (_,subJson):(String, JSON) in jsonData["missionOfTheDay"] {
                                self.missionOfDay.append(subJson.stringValue)
                            }
                            self.mainScreenSetup(true)
                        }
                        
                    } else {
                        print("A connection could not be established to the update server")
                        print("Unable to download \(path)")
                        if (type == "add")
                        {
                            self.getFileData("add", index: index + 1)
                        }
                        else if (type == "update")
                        {
                            self.getFileData("update", index: index + 1)
                        }
                        else if (type == "mainscreen")
                        {
                            self.newInCod.append("Connection couldn't be established")
                            self.missionOfDay.append("Connection couldn't be established")
                            self.mainScreenSetup(true)
                        }
                        
                    }
                }
                else {
                    
                    print("A connection could not be established to the update server")
                    print("Unable to download \(path)")
                    if (type == "add")
                    {
                        self.getFileData("add", index: index + 1)
                    }
                    else if (type == "update")
                    {
                        self.getFileData("update", index: index + 1)
                    }
                    else if (type == "mainscreen")
                    {
                        self.newInCod.append("Connection couldn't be established")
                        self.missionOfDay.append("Connection couldn't be established")
                        self.mainScreenSetup(true)
                    }
                }
        }
    }
    
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //            Download Image            //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    func downloadImage(path: String, index: Int, type: String){
        
        let imagePath = NSURL(string: "\(mainPath)\(path).jpg")
        let url = NSMutableURLRequest(URL: imagePath!)
        url.cachePolicy = .ReloadIgnoringLocalCacheData
        
        NSURLCache.sharedURLCache().removeAllCachedResponses()
        NSURLCache.sharedURLCache().diskCapacity = 0
        NSURLCache.sharedURLCache().memoryCapacity = 0
        
        if (downloadImages){
            Alamofire.request(url).responseData
                {result in
                    if (result.response?.statusCode != nil){
                        if (result.response?.statusCode)! == 200{
                    
                            let imageData = (data: result.data! as NSData)
                    
                            if (type == "add")
                            {
                                self.addImageData.append(imageData)
                                self.addImageName.append(path)
                                print("Finished with ADD image: \(path)")
                                self.saveDataByImagePath(path, add: true)
                                self.getImageData("add", index: index + 1)
                            }
                            else if (type == "update")
                            {
                                self.updateImageData.append(imageData)
                                self.updateImageName.append(path)
                                print("Finished with UPDATE image: \(path)")
                                self.saveDataByImagePath(path, add: false)
                                self.getImageData("update", index: index + 1)
                            }
                        
                        } else {
                            if (type == "add")
                            {
                                self.addImageData.append(self.defaultImage)
                                self.addImageName.append(path)
                                print("Unable to download \(path)")
                                print("Default image set.")
                                self.saveDataByImagePath(path, add: true)
                                self.getImageData("add", index: index + 1)
                            }
                            else if (type == "update")
                            {
                                self.updateImageData.append(self.defaultImage)
                                self.updateImageName.append(path)
                                print("Unable to download \(path)")
                                print("Default image set.")
                                self.saveDataByImagePath(path, add: false)
                                self.getImageData("update", index: index + 1)
                            }
                        
                        }
                    } else {
                        if (type == "add")
                        {
                            self.addImageData.append(self.defaultImage)
                            self.addImageName.append(path)
                            print("Unable to download \(path)")
                            print("Default image set.")
                            self.saveDataByImagePath(path, add: true)
                            self.getImageData("add", index: index + 1)
                        }
                        else if (type == "update")
                        {
                            self.updateImageData.append(self.defaultImage)
                            self.updateImageName.append(path)
                            print("Unable to download \(path)")
                            print("Default image set.")
                            self.saveDataByImagePath(path, add: false)
                            self.getImageData("update", index: index + 1)
                        }
                    }
            }
        } else {
            if (type == "add")
            {
                self.addImageData.append(self.defaultImage)
                self.addImageName.append(path)
                self.saveDataByImagePath(path, add: true)
                self.getImageData("add", index: index + 1)
            }
            else if (type == "update")
            {
                self.updateImageData.append(self.defaultImage)
                self.updateImageName.append(path)
                self.saveDataByImagePath(path, add: false)
                self.getImageData("update", index: index + 1)
            }
        }
    }
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //            Get File Data             //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    
    func getFileData(type: String, index: Int){
        
        if (type == "add")
        {
            let toAdd = manifestData["appVersion\(appVersion)"]["add"]["files"]
            if index < toAdd.count
            {
                sendUpdateMessage("Downloading new file \(index + 1) of \(toAdd.count)")
                
                fileExists(toAdd[index].stringValue){
                    (result: Bool) in
                    if result == true{
                        print("\(toAdd[index].string!) already existed")
                        self.getFileData("add", index: index + 1)
                    } else {
                        self.downloadFile(toAdd[index].string!, index: index, type: type)
                    }
                }
                
            }
            else
            {
                print("Done downloading ADD files")
                getFileData("update", index: 0)
            }
        }
        else if (type == "update")
        {
            let toUpdate = manifestData["appVersion\(appVersion)"]["update"]["files"]
            if index < toUpdate.count
            {
                sendUpdateMessage("Downloading update file \(index + 1) of \(toUpdate.count)")
                downloadFile(toUpdate[index].string!, index: index, type: type)
                
            }
            else
            {
                print("Done downloading UPDATE files")
                downloadDelegator("File Data")
            }
        }
    }
    
    func saveDataByImagePath(path: String, add: Bool){
        if add {
            for file in addFileData{
                if path == file["imagePath"].stringValue{
                    saveAddFile(file)
                }
            }
        } else {
            for file in updateFileData{
                if path == file["imagePath"].stringValue{
                    
                }
            }
        }
        
        
    }
    
    func saveAddFile(file : JSON){
        let add = true
        let category = file["category"].stringValue
        
        if category == "Gun"{
            if !(fileExists(file["filePath"].stringValue, category: "Weapon")) {
                saveWeapon(file, add: add)
            }
        } else if category == "Perk"{
            if !(fileExists(file["filePath"].stringValue, category: "Perk")) {
                savePerk(file, add: add)
            }
        } else if category == "Attachment"{
            if !(fileExists(file["filePath"].stringValue, category: "Attachment")) {
                saveAttachment(file, add: add)
            }
        } else if category == "Lethal"{
            if !(fileExists(file["filePath"].stringValue, category: "Lethal")) {
                saveLethal(file, add: add)
            }
        } else if category == "Tactical"{
            if !(fileExists(file["filePath"].stringValue, category: "Tactical")) {
                saveTactical(file, add: add)
            }
        } else if category == "Scorestreak"{
            if !(fileExists(file["filePath"].stringValue, category: "Scorestreak")) {
                saveScorestreak(file, add: add)
            }
        } else if category == "Specialist"{
            if !(fileExists(file["filePath"].stringValue, category: "Specialist")) {
                saveSpecialist(file, add: add)
            }
        } else if category == "Map"{
            if !(fileExists(file["filePath"].stringValue, category: "Map")) {
                saveMap(file, add: add)
            }
        }
    }
    
    func saveUpdateFile(file : JSON){
        for file in updateFileData{
            let update = false
            let category = file["category"].stringValue
            if category == "Gun"{
                
                if (fileExists(file["filePath"].stringValue, category: "Weapon")) {
                    deleteFile(file["filePath"].stringValue, category: "Weapon")
                }
                saveWeapon(file, add: update)
                
            } else if category == "Perk" {
                
                if (fileExists(file["filePath"].stringValue, category: "Perk")) {
                    deleteFile(file["filePath"].stringValue, category: "Perk")
                }
                savePerk(file, add: update)
                
            } else if category == "Attachment" {
                
                if (fileExists(file["filePath"].stringValue, category: "Attachment")) {
                    deleteFile(file["filePath"].stringValue, category: "Attachment")
                }
                saveAttachment(file, add: update)
            } else if category == "Lethal" {
                
                if (fileExists(file["filePath"].stringValue, category: "Lethal")) {
                    deleteFile(file["filePath"].stringValue, category: "Lethal")
                }
                saveLethal(file, add: update)
            } else if category == "Tactical" {
                
                if (fileExists(file["filePath"].stringValue, category: "Tactical")) {
                    deleteFile(file["filePath"].stringValue, category: "Tactical")
                }
                saveTactical(file, add: update)
            } else if category == "Scorestreak" {
                
                if (fileExists(file["filePath"].stringValue, category: "Scorestreak")) {
                    deleteFile(file["filePath"].stringValue, category: "Scorestreak")
                }
                saveScorestreak(file, add: update)
            } else if category == "Specialist" {
                
                if (fileExists(file["filePath"].stringValue, category: "Specialist")) {
                    deleteFile(file["filePath"].stringValue, category: "Specialist")
                }
                saveSpecialist(file, add: update)
            } else if category == "Map" {
                
                if (fileExists(file["filePath"].stringValue, category: "Map")) {
                    deleteFile(file["filePath"].stringValue, category: "Map")
                }
                saveMap(file, add: update)
            }
        }
    }
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //           Get Image Paths            //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    func getImagePaths(){
        
        for file in addFileData{
            if file["category"].stringValue == "Gun"{
                addImagePaths.append(file["imageSqPath"].stringValue)
            } else if file["category"].stringValue == "Specialist"{
                addImagePaths.append(file["imagePWPath"].stringValue)
                addImagePaths.append(file["imageAbilityPath"].stringValue)
            } else if file["category"].stringValue == "Map"{
                addImagePaths.append(file["imageBasicPath"].stringValue)
                addImagePaths.append(file["imageSNDPath"].stringValue)
                addImagePaths.append(file["imageDomPath"].stringValue)
                addImagePaths.append(file["imageUplinkPath"].stringValue)
                addImagePaths.append(file["imageDemoPath"].stringValue)
            }
            
            // 'imagePath' MUST BE ADDED LAST
            addImagePaths.append(file["imagePath"].stringValue)
        }
        for file in updateFileData{
            if file["category"].stringValue == "Gun"{
                updateImagePaths.append(file["imageSqPath"].stringValue)
            } else if file["category"].stringValue == "Specialist"{
                updateImagePaths.append(file["imagePWPath"].stringValue)
                updateImagePaths.append(file["imageAbilityPath"].stringValue)
            } else if file["category"].stringValue == "Map"{
                updateImagePaths.append(file["imageBasicPath"].stringValue)
                updateImagePaths.append(file["imageSNDPath"].stringValue)
                updateImagePaths.append(file["imageDomPath"].stringValue)
                updateImagePaths.append(file["imageUplinkPath"].stringValue)
                updateImagePaths.append(file["imageDemoPath"].stringValue)
            }
            
            // 'imagePath' MUST BE ADDED LAST
            updateImagePaths.append(file["imagePath"].stringValue)
        }
        
        let addPath = manifestData["appVersion\(appVersion)"]["add"]["images"]
        let updatePath = manifestData["appVersion\(appVersion)"]["update"]["images"]
        
        for (_,subJson):(String, JSON) in addPath {
            addImagePaths.append(subJson.stringValue)
        }
        for (_,subJson):(String, JSON) in updatePath {
            updateImagePaths.append(subJson.stringValue)
        }
        print("Done comiling image paths")
        downloadDelegator("Image Paths")
    }
    
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //            Get Image Data            //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    func getImageData(type: String, index: Int)
    {
        if (type == "add")
        {
            if index < addImagePaths.count{
                sendUpdateMessage("Downloading new image \(index + 1) of \(addImagePaths.count)")
                downloadImage(addImagePaths[index], index: index, type: "add")
            }
            else
            {
                print("Done downloading ADD images")
                getImageData("update", index: 0)
            }
        }
        else if (type == "update")
        {
            if index < updateImagePaths.count{
                sendUpdateMessage("Downloading update image \(index + 1) of \(updateImagePaths.count)")
                downloadImage(updateImagePaths[index], index: index, type: "update")
            }
            else
            {
                print("Done downloading UPDATE images")
                downloadDelegator("Image Data")
            }
        }
    }
    
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //              Core Data               //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    func saveCoreData(context: NSManagedObjectContext){
        do {
            try context.save()
        } catch {
            print("Could not save file to core data.")
        }
    }
    
    func loopAllFiles(action: String){
        
        let entityList = ["Weapon", "Perk", "Attachment", "Lethal", "Tactical", "Scorestreak", "Specialist", "Map"]
        
        for entity in entityList{
            if (action == "Clear Data"){
                clearCoreData(entity)
                if (entityList.indexOf(entity) == entityList.count){
                    print("All Data Cleared")
                }
                NSUserDefaults.standardUserDefaults().setValue(0, forKeyPath: "appVersion")
                NSUserDefaults.standardUserDefaults().setValue(0, forKeyPath: "day")
            } else if (action == "Image Paths"){
                getCoreDataImagePaths(entity)
                if (entityList.indexOf(entity) == entityList.count){
                    //imageDownloadDelegator("Image Paths")
                    print("not implemented")
                }
            }
        }
    }
    
    func clearCoreData(category: String) {
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: category)
        request.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0{
                for result: AnyObject in results{
                    context.deleteObject(result as! NSManagedObject)
                    do {
                        try context.save()
                    }
                    catch {
                        print("Could not delete")
                    }
                }
            }else{
                print("Nothing to delete")
            }
            
        } catch {
            print("Could not fetch category")
        }
        
    }
    func getCoreDataImagePaths(category: String){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: category)
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0{
                for result: AnyObject in results{
                    
                    addImagePaths.append(result.valueForKey("imagePath")!.stringValue)
                }
            }
            
        }
        catch {
            print("Could not fetch.")
        }
    }
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //           Save Operations            //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    //
    // WEAPONS
    //
    func saveWeapon(file: JSON, add: Bool){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newWeapon = NSEntityDescription.insertNewObjectForEntityForName("Weapon", inManagedObjectContext: context) as NSManagedObject
        
        newWeapon.setValue("Weapon", forKey: "category")
        newWeapon.setValue(file["weaponType"].stringValue, forKey: "weaponType")
        newWeapon.setValue(file["lvlAvailable"].stringValue, forKey: "lvlAvailable")
        newWeapon.setValue(file["weaponClass"].stringValue, forKey: "weaponClass")
        newWeapon.setValue(file["weaponName"].stringValue, forKey: "weaponName")
        newWeapon.setValue(file["weaponDescription"].stringValue, forKey: "weaponDescription")
        
        newWeapon.setValue(file["magazineSize"].stringValue, forKey: "magazineSize")
        newWeapon.setValue(file["totalAmmo"].stringValue, forKey: "totalAmmo")
        newWeapon.setValue(file["fireMode"].stringValue, forKey: "fireMode")
        newWeapon.setValue(file["rateOfFire"].stringValue, forKey: "rof")
        
        newWeapon.setValue(file["adsTime"].stringValue, forKey: "adsTime")
        newWeapon.setValue(file["reloadTime"].stringValue, forKey: "reloadTime")
        
        newWeapon.setValue(file["damageDistanceClose"].stringValue, forKey: "damageClose")
        newWeapon.setValue(file["damageDistanceFar"].stringValue, forKey: "damageFar")
        
        newWeapon.setValue(file["pros"].stringValue, forKey: "pros")
        newWeapon.setValue(file["cons"].stringValue, forKey: "cons")
        
        newWeapon.setValue(file["imagePath"].stringValue, forKey: "imagePath")
        newWeapon.setValue(file["filePath"].stringValue, forKey: "filePath")
        
        var imageToSave = NSData()
        var imageSqToSave = NSData()
        
        // Regular
        if add {imageToSave = addImageData[addImageName.indexOf(file["imagePath"].stringValue)!]}
        else {imageToSave = updateImageData[updateImageName.indexOf(file["imagePath"].stringValue)!]}
        // Square
        if add {imageSqToSave = addImageData[addImageName.indexOf(file["imageSqPath"].stringValue)!]}
        else {imageSqToSave = updateImageData[updateImageName.indexOf(file["imageSqPath"].stringValue)!]}
        
        // Regular
        if !(imageToSave == defaultImage){
            newWeapon.setValue(imageToSave, forKey: "imageData")
        } else {
            newWeapon.setValue(defaultWeaponImage, forKey: "imageData")
        }
        // Square
        if !(imageSqToSave == defaultImage){
            newWeapon.setValue(imageSqToSave, forKey: "imageSqData")
        } else {
            newWeapon.setValue(defaultWeaponImage, forKey: "imageSqData")
        }
        
        saveCoreData(context)
        let filePath = file["filePath"].stringValue
        print("Saved weapon: \(filePath)")

    }
    
    //
    // PERKS
    //
    func savePerk(file: JSON, add: Bool){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newPerk = NSEntityDescription.insertNewObjectForEntityForName("Perk", inManagedObjectContext: context) as NSManagedObject
        
        newPerk.setValue(file["category"].stringValue, forKey: "category")
        newPerk.setValue(file["perkTier"].stringValue, forKey: "perkTier")
        newPerk.setValue(file["perkName"].stringValue, forKey: "perkName")
        newPerk.setValue(file["lvlAvailable"].stringValue, forKey: "lvlAvailable")
        newPerk.setValue(file["perkDescription"].stringValue, forKey: "perkDescription")
        newPerk.setValue(file["perkUse"].stringValue, forKey: "perkUse")
        
        newPerk.setValue(file["imagePath"].stringValue, forKey: "imagePath")
        newPerk.setValue(file["filePath"].stringValue, forKey: "filePath")
        
        var imageToSave = NSData()
        
        if add {imageToSave = addImageData[addImageName.indexOf(file["imagePath"].stringValue)!]}
        else {imageToSave = updateImageData[updateImageName.indexOf(file["imagePath"].stringValue)!]}
        
        if !(imageToSave == defaultImage){
            newPerk.setValue(imageToSave, forKey: "imageData")
        } else {
            newPerk.setValue(defaultWeaponImage, forKey: "imageData")
        }
        
        saveCoreData(context)
        let filePath = file["filePath"].stringValue
        print("Saved perk: \(filePath)")
    }
    
    //
    // ATTACHMENTS
    //
    func saveAttachment(file: JSON, add: Bool){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newAttachment = NSEntityDescription.insertNewObjectForEntityForName("Attachment", inManagedObjectContext: context) as NSManagedObject
        
        newAttachment.setValue(file["category"].stringValue, forKey: "category")
        newAttachment.setValue(file["attachmentType"].stringValue, forKey: "attachmentType")
        newAttachment.setValue(file["attachmentName"].stringValue, forKey: "attachmentName")
        newAttachment.setValue(file["attachmentDescription"].stringValue, forKey: "attachmentDescription")
        newAttachment.setValue(file["attachmentAvailable"].stringValue, forKey: "attachmentAvailable")
        
        newAttachment.setValue(file["lvlAvailableAssaultrifle"].stringValue, forKey: "lvlAvailableAssaultrifle")
        newAttachment.setValue(file["lvlAvailableSmg"].stringValue, forKey: "lvlAvailableSmg")
        newAttachment.setValue(file["lvlAvailableShotgun"].stringValue, forKey: "lvlAvailableShotgun")
        newAttachment.setValue(file["lvlAvailableSniper"].stringValue, forKey: "lvlAvailableSniper")
        newAttachment.setValue(file["lvlAvailableLmg"].stringValue, forKey: "lvlAvailableLmg")
        newAttachment.setValue(file["lvlAvailablePistol"].stringValue, forKey: "lvlAvailablePistol")
        
        newAttachment.setValue(file["imagePath"].stringValue, forKey: "imagePath")
        newAttachment.setValue(file["filePath"].stringValue, forKey: "filePath")
        
        var imageToSave = NSData()
        
        if add {imageToSave = addImageData[addImageName.indexOf(file["imagePath"].stringValue)!]}
        else {imageToSave = updateImageData[updateImageName.indexOf(file["imagePath"].stringValue)!]}
        
        if !(imageToSave == defaultImage){
            newAttachment.setValue(imageToSave, forKey: "imageData")
        } else {
            newAttachment.setValue(defaultWeaponImage, forKey: "imageData")
        }
        
        saveCoreData(context)
        let filePath = file["filePath"].stringValue
        print("Saved attachment: \(filePath)")
    }
    
    //
    // LETHALS
    //
    
    func saveLethal(file: JSON, add: Bool){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newAttachment = NSEntityDescription.insertNewObjectForEntityForName("Lethal", inManagedObjectContext: context) as NSManagedObject
        
        newAttachment.setValue(file["category"].stringValue, forKey: "category")
        newAttachment.setValue(file["lethalName"].stringValue, forKey: "lethalName")
        newAttachment.setValue(file["lvlAvailable"].stringValue, forKey: "lvlAvailable")
        newAttachment.setValue(file["lethalDescription"].stringValue, forKey: "lethalDescription")
        newAttachment.setValue(file["lethalRecommendedUsage"].stringValue, forKey: "lethalUsage")
        
        newAttachment.setValue(file["imagePath"].stringValue, forKey: "imagePath")
        newAttachment.setValue(file["filePath"].stringValue, forKey: "filePath")
        
        var imageToSave = NSData()
        
        if add {imageToSave = addImageData[addImageName.indexOf(file["imagePath"].stringValue)!]}
        else {imageToSave = updateImageData[updateImageName.indexOf(file["imagePath"].stringValue)!]}
        
        if !(imageToSave == defaultImage){
            newAttachment.setValue(imageToSave, forKey: "imageData")
        } else {
            newAttachment.setValue(defaultWeaponImage, forKey: "imageData")
        }
        
        saveCoreData(context)
        let filePath = file["filePath"].stringValue
        print("Saved lethal: \(filePath)")
    }
    
    //
    // TACTICALS
    //
    
    func saveTactical(file: JSON, add: Bool){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newAttachment = NSEntityDescription.insertNewObjectForEntityForName("Tactical", inManagedObjectContext: context) as NSManagedObject
        
        newAttachment.setValue(file["category"].stringValue, forKey: "category")
        newAttachment.setValue(file["tacticalName"].stringValue, forKey: "tacticalName")
        newAttachment.setValue(file["lvlAvailable"].stringValue, forKey: "lvlAvailable")
        newAttachment.setValue(file["tacticalDescription"].stringValue, forKey: "tacticalDescription")
        newAttachment.setValue(file["tacticalRecommendedUsage"].stringValue, forKey: "tacticalUsage")
        
        newAttachment.setValue(file["imagePath"].stringValue, forKey: "imagePath")
        newAttachment.setValue(file["filePath"].stringValue, forKey: "filePath")
        
        var imageToSave = NSData()
        
        if add {imageToSave = addImageData[addImageName.indexOf(file["imagePath"].stringValue)!]}
        else {imageToSave = updateImageData[updateImageName.indexOf(file["imagePath"].stringValue)!]}
        
        if !(imageToSave == defaultImage){
            newAttachment.setValue(imageToSave, forKey: "imageData")
        } else {
            newAttachment.setValue(defaultWeaponImage, forKey: "imageData")
        }
        
        saveCoreData(context)
        let filePath = file["filePath"].stringValue
        print("Saved tactical: \(filePath)")
    }
    
    //
    // SCORESTREAKS
    //
    
    func saveScorestreak(file: JSON, add: Bool){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newAttachment = NSEntityDescription.insertNewObjectForEntityForName("Scorestreak", inManagedObjectContext: context) as NSManagedObject
        
        newAttachment.setValue(file["category"].stringValue, forKey: "category")
        newAttachment.setValue(file["scorestreakName"].stringValue, forKey: "scorestreakName")
        newAttachment.setValue(file["lvlAvailable"].stringValue, forKey: "lvlAvailable")
        newAttachment.setValue(file["scorestreaksPoints"].stringValue, forKey: "scorestreakPoints")
        newAttachment.setValue(file["scorestreakDescription"].stringValue, forKey: "scorestreakDescription")
        
        newAttachment.setValue(file["imagePath"].stringValue, forKey: "imagePath")
        newAttachment.setValue(file["filePath"].stringValue, forKey: "filePath")
        
        var imageToSave = NSData()
        
        if add {imageToSave = addImageData[addImageName.indexOf(file["imagePath"].stringValue)!]}
        else {imageToSave = updateImageData[updateImageName.indexOf(file["imagePath"].stringValue)!]}
        
        if !(imageToSave == defaultImage){
            newAttachment.setValue(imageToSave, forKey: "imageData")
        } else {
            newAttachment.setValue(defaultWeaponImage, forKey: "imageData")
        }
        
        saveCoreData(context)
        let filePath = file["filePath"].stringValue
        print("Saved scorestreak: \(filePath)")
    }
    
    //
    // SPECIALISTS
    //
    func saveSpecialist(file: JSON, add: Bool){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newSpecialist = NSEntityDescription.insertNewObjectForEntityForName("Specialist", inManagedObjectContext: context) as NSManagedObject
        
        newSpecialist.setValue(file["category"].stringValue, forKey: "category")
        newSpecialist.setValue(file["specialistName"].stringValue, forKey: "specialistName")
        newSpecialist.setValue(file["specialistPowerWeaponName"].stringValue, forKey: "specialistPWName")
        newSpecialist.setValue(file["specialistAbilityName"].stringValue, forKey: "specialistAbilityName")
        newSpecialist.setValue(file["specialistCallsign"].stringValue, forKey: "specialistCallsign")
        newSpecialist.setValue(file["lvlAvailable"].stringValue, forKey: "lvlAvailable")
        newSpecialist.setValue(file["specialistDescription"].stringValue, forKey: "specialistDescription")
        newSpecialist.setValue(file["specialistPowerWeaponDescription"].stringValue, forKey: "specialistPWDescription")
        newSpecialist.setValue(file["specialistAbilityDescription"].stringValue, forKey: "specialistAbilityDescription")
        
        newSpecialist.setValue(file["imagePath"].stringValue, forKey: "imagePath")
        newSpecialist.setValue(file["imagePWPath"].stringValue, forKey: "imagePWPath")
        newSpecialist.setValue(file["imageAbilityPath"].stringValue, forKey: "imageAbilityPath")
        newSpecialist.setValue(file["filePath"].stringValue, forKey: "filePath")
        
        var imageToSave = NSData()
        var imagePWToSave = NSData()
        var imageAbilityToSave = NSData()
        
        // Main
        if add {imageToSave = addImageData[addImageName.indexOf(file["imagePath"].stringValue)!]}
        else {imageToSave = updateImageData[updateImageName.indexOf(file["imagePath"].stringValue)!]}
        // Power Weapon
        if add {imagePWToSave = addImageData[addImageName.indexOf(file["imagePWPath"].stringValue)!]}
        else {imagePWToSave = updateImageData[updateImageName.indexOf(file["imagePWPath"].stringValue)!]}
        // Ability
        if add {imageAbilityToSave = addImageData[addImageName.indexOf(file["imagePWPath"].stringValue)!]}
        else {imageAbilityToSave = updateImageData[updateImageName.indexOf(file["imagePWPath"].stringValue)!]}
        
        // Main
        if !(imageToSave == defaultImage){
            newSpecialist.setValue(imageToSave, forKey: "imageData")
        } else {
            newSpecialist.setValue(defaultWeaponImage, forKey: "imageData")
        }
        // Power Weapon
        if !(imagePWToSave == defaultImage){
            newSpecialist.setValue(imagePWToSave, forKey: "imagePWData")
        } else {
            newSpecialist.setValue(defaultWeaponImage, forKey: "imagePWData")
        }
        // Ability
        if !(imageAbilityToSave == defaultImage){
            newSpecialist.setValue(imageAbilityToSave, forKey: "imageAbilityData")
        } else {
            newSpecialist.setValue(defaultWeaponImage, forKey: "imageAbilityData")
        }
        
        saveCoreData(context)
        let filePath = file["filePath"].stringValue
        print("Saved specialist: \(filePath)")
        
    }
    
    //
    // Maps
    //
    
    func saveMap(file: JSON, add: Bool){
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newMap = NSEntityDescription.insertNewObjectForEntityForName("Map", inManagedObjectContext: context) as NSManagedObject
        
        newMap.setValue(file["category"].stringValue, forKey: "category")
        newMap.setValue(file["mapName"].stringValue, forKey: "mapName")
        newMap.setValue(file["mapDescription"].stringValue, forKey: "mapDesc")
        newMap.setValue(file["mapLocation"].stringValue, forKey: "mapLoc")
        newMap.setValue(file["isDLC"].stringValue, forKey: "isDLC")
        newMap.setValue(file["dlcName"].stringValue, forKey: "dlcName")
        
        newMap.setValue(file["imagePath"].stringValue, forKey: "imagePath")
        newMap.setValue(file["imageBasicPath"].stringValue, forKey: "imageBasicPath")
        newMap.setValue(file["imageSNDPath"].stringValue, forKey: "imageSNDPath")
        newMap.setValue(file["imageDomPath"].stringValue, forKey: "imageDomPath")
        newMap.setValue(file["imageUplinkPath"].stringValue, forKey: "imageUplinkPath")
        newMap.setValue(file["imageDemoPath"].stringValue, forKey: "imageDemoPath")
        newMap.setValue(file["filePath"].stringValue, forKey: "filePath")
        
        var imageToSave = NSData()
        var imageBasicToSave = NSData()
        var imageSNDToSave = NSData()
        var imageDomToSave = NSData()
        var imageUplinkToSave = NSData()
        var imageDemoToSave = NSData()
        
        // Main
        if add {imageToSave = addImageData[addImageName.indexOf(file["imagePath"].stringValue)!]}
        else {imageToSave = updateImageData[updateImageName.indexOf(file["imagePath"].stringValue)!]}
        // Basic
        if add {imageBasicToSave = addImageData[addImageName.indexOf(file["imageBasicPath"].stringValue)!]}
        else {imageBasicToSave = updateImageData[updateImageName.indexOf(file["imageBasicPath"].stringValue)!]}
        // SND
        if add {imageSNDToSave = addImageData[addImageName.indexOf(file["imageSNDPath"].stringValue)!]}
        else {imageSNDToSave = updateImageData[updateImageName.indexOf(file["imageSNDPath"].stringValue)!]}
        // DOM
        if add {imageDomToSave = addImageData[addImageName.indexOf(file["imageDomPath"].stringValue)!]}
        else {imageDomToSave = updateImageData[updateImageName.indexOf(file["imageDomPath"].stringValue)!]}
        // UPLINK
        if add {imageUplinkToSave = addImageData[addImageName.indexOf(file["imageUplinkPath"].stringValue)!]}
        else {imageUplinkToSave = updateImageData[updateImageName.indexOf(file["imageUplinkPath"].stringValue)!]}
        // DEMO
        if add {imageDemoToSave = addImageData[addImageName.indexOf(file["imageDemoPath"].stringValue)!]}
        else {imageDemoToSave = updateImageData[updateImageName.indexOf(file["imageDemoPath"].stringValue)!]}
        
        // Main
        if !(imageToSave == defaultImage){
            newMap.setValue(imageToSave, forKey: "imageData")
        } else {
            newMap.setValue(defaultWeaponImage, forKey: "imageData")
        }
        // Basic
        if !(imageBasicToSave == defaultImage){
            newMap.setValue(imageBasicToSave, forKey: "imageBasicData")
        } else {
            newMap.setValue(defaultWeaponImage, forKey: "imageBasicData")
        }
        // SND
        if !(imageSNDToSave == defaultImage){
            newMap.setValue(imageSNDToSave, forKey: "imageSNDData")
        } else {
            newMap.setValue(defaultWeaponImage, forKey: "imageSNDData")
        }
        // DOM
        if !(imageDomToSave == defaultImage){
            newMap.setValue(imageDomToSave, forKey: "imageDomData")
        } else {
            newMap.setValue(defaultWeaponImage, forKey: "imageDomData")
        }
        // UPLINK
        if !(imageUplinkToSave == defaultImage){
            newMap.setValue(imageUplinkToSave, forKey: "imageUplinkData")
        } else {
            newMap.setValue(defaultWeaponImage, forKey: "imageUplinkData")
        }
        // DEMO
        if !(imageDemoToSave == defaultImage){
            newMap.setValue(imageDemoToSave, forKey: "imageDemoData")
        } else {
            newMap.setValue(defaultWeaponImage, forKey: "imageDemoData")
        }
        
        saveCoreData(context)
        let filePath = file["filePath"].stringValue
        print("Saved Map: \(filePath)")
    }
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //             File Exists              //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    func fileExists(filePath: String, category: String) -> Bool{
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: category)
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "filePath = %@", filePath)
        
        do {
            let results = try context.executeFetchRequest(request)
            if results.count > 0{
                return true
            }
        }
        catch {
            print("Error fetching \(category) from CoreData")
        }
        return false
    }
   
    //
    // Loops through all entities
    //
    func fileExists(filePath: String, completion: (result: Bool) -> Void){

        let entityList = ["Weapon", "Perk", "Attachment", "Lethal", "Tactical", "Scorestreak", "Specialist", "Map"]
        
        var exists = false
        
        for entity in entityList{
            exists = fileExists(filePath, category: entity)
            if(exists){
                completion(result: true)
                return
            }
        }
        completion(result: false)
    }
    
    //
    // Deletes a file given an entity type and path
    //
    func deleteFile(filePath: String, category: String){
        
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let request = NSFetchRequest(entityName: category)
        
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "filePath = %@", filePath)
        
        do {
            
            let results = try context.executeFetchRequest(request)
            
            if results.count > 0{
                for result: AnyObject in results{
                    context.deleteObject(result as! NSManagedObject)
                    do {
                        try context.save()
                        print("Deleted a file")
                    }
                    catch {
                        print("Could not save")
                    }
                }
            }else{
                print("No files found")
            }
            
        } catch {
            print("Error fetching from file")
        }
    }
    
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//
    //           Meta Functions             //
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//
    // Description                          //
    //--------------------------------------//
    
    var newInCod = [String]()
    var missionOfDay = [String]()
    
    func mainScreenSetup(done: Bool){
        if !(done){
            print("Retrieving main screen messages")
            downloadFile("", index: -1, type: "mainscreen")
        }
        else
        {
            NSNotificationCenter.defaultCenter().postNotificationName("mainMessages", object: nil)
            print(getNewInCod());
            print(getMissionOfDay());
        }
    }
    
    func getNewInCod() -> [String]{
        return newInCod
    }
    func getMissionOfDay() -> [String]{
        return missionOfDay
    }
    
    
    func sendUpdateMessage(message: String){
        Globals.global.updateLogMessage = message
        NSNotificationCenter.defaultCenter().postNotificationName("updateLog", object: nil)
    }
    
}