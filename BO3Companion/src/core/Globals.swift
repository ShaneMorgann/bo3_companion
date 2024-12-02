//
//  Globals.swift
//  BO3Companion
//
//  Created by Shane Morgan on 10/10/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import UIKit
import CoreGraphics

public class Globals{
    static let global = Globals()
    
    var weaponNameSelected = String()
    var weaponClassSelected = String()
    
    var perkNameSelected = String()
    
    var attachmentNameSelected = String()
    
    var equipmentNameSelected = String()
    var equipmentTypeSelected = String()

    var specialistCallsignSelected = String()
    
    var updateLogMessage = String()
    
    var mapNameSelected = String()
    
    var timerMain = NSTimer()
    var hasTimerMain = false
    var canCheckMain = true
    
    var editingClass = Bool()
    var cacSetValue = String()
    var cacSegueID = String()
    
    
    var cacList = [String : String]()
    func resetCACList(){
        cacList = ["cacPWeapon" : "none", "cacPOptic" : "none", "cacPAtt1" : "none", "cacPAtt2" : "none", "cacPAtt3" : "none", "cacPAtt4" : "none", "cacPAtt5" : "none",
            "cacSWeapon": "none", "cacSOptic" : "none", "cacSAtt1" : "none", "cacSAtt2" : "none",
            "cacPerk1" : "none", "cacPerk1G" : "none", "cacPerk2" : "none", "cacPerk2G" : "none", "cacPerk3" : "none", "cacPerk3G" : "none",
            "cacLethal" : "none", "cacTactical" : "none",
            "cacWC1" : "none", "cacWC2" : "none", "cacWC3" : "none", "lethalx2" : "false", "tacticalx2" : "false"]
    }
    
}
struct cellProperties {
    let basicCellHeightWithImage: CGFloat = 70
    let headerBgColor = UIColor(red: 75/255, green: 75/255, blue: 75/255, alpha: 0.7)
    let headerTextColor = UIColor.whiteColor()
    
    func tableViewHeader(headerText: String) -> UIView?{
        let header: UILabel = UILabel()
        header.backgroundColor = headerBgColor
        header.textColor = headerTextColor
        header.text = headerText
        return header
    }
}

struct QualityOfLife {
    func getRoundImage(imageView: UIImageView, borderWidth: CGFloat, borderColor: UIColor) -> UIImageView{
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = borderWidth
        imageView.layer.borderColor = borderColor.CGColor
        return imageView
    }
    func getRoundedCornerImage(imageView: UIImageView, borderWidth: CGFloat, borderColor: UIColor) -> UIImageView{
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = borderWidth
        imageView.layer.borderColor = borderColor.CGColor
        return imageView
    }
    
    func screenShotMethod(view : UIView) {
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

extension UIImage {
    public func imageRotatedByDegrees(degrees: CGFloat, flip: Bool) -> UIImage {
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPointZero, size: size))
        let t = CGAffineTransformMakeRotation(degreesToRadians(degrees));
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        CGContextTranslateCTM(bitmap, rotatedSize.width / 2.0, rotatedSize.height / 2.0);
        
        //   // Rotate the image context
        CGContextRotateCTM(bitmap, degreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        var yFlip: CGFloat
        
        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }
        
        CGContextScaleCTM(bitmap, yFlip, -1.0)
        CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), CGImage)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}