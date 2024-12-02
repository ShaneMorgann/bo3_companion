//
//  MultiplayerMapImage.swift
//  BO3Companion
//
//  Created by Shane Morgan on 11/2/15.
//  Copyright © 2015 Shane Morgan. All rights reserved.
//

import Foundation

class MultiplayerMapImage: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var mapImageView: UIImageView!
    
    @IBOutlet var done: UIButton!
    
    
    @IBOutlet var mapTitleLabel: UILabel!
    
    var mapName = String()
    var mapTitle = String()
    var mapType = String()
    
    @IBAction func doneButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        var convTitle = String()
        if mapType == ""{
            convTitle = "Basic"
        } else if mapType == "Dom"{
            convTitle = "Domination"
        } else if mapType == "Uplink"{
            convTitle = "Uplink"
        } else if mapType == "Demo"{
            convTitle = "Demolition"
        } else if mapType == "SND"{
            convTitle = "SnD"
        }
        mapTitle = "\(mapName) - \(convTitle)"
        mapTitleLabel.text = mapTitle
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        setImage()
    }
    
    func setImage(){
        mapImageView.image = AppData().getMapImage(mapName, type: mapType)
        mapImageView.image = mapImageView.image?.imageRotatedByDegrees(90.0, flip: false)
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return self.mapImageView
    }
    
    
}