//
//  MapViewController.swift
//  JackTheRipper
//
//  Created by Jay Issuree on 02/12/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import MapKit
import UIKit
import UserNotifications

class MapViewController: UIViewController, CLLocationManagerDelegate, UNUserNotificationCenterDelegate {
    
    var locationManager:CLLocationManager = CLLocationManager()
    
    let geoFenceRegion1:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 51.520045,
    longitude: -0.060630), radius: 20, identifier: "Victim")
    
    let geoFenceRegion2:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 51.520415,
    longitude: -0.072553), radius: 20, identifier: "Victim")
    
    let geoFenceRegion3:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 51.513959,
    longitude: -0.065441), radius: 20, identifier: "Victim")
    
    let geoFenceRegion4:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 51.514020,
    longitude: -0.076786), radius: 20, identifier: "Victim")
    
    let geoFenceRegion5:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 51.519076,
    longitude: -0.075825), radius: 20, identifier: "Victim")
    
    let geoFenceRegion6:CLCircularRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 51.519393,
    longitude: -0.074271), radius: 10, identifier: "Victim")

     override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
    }
        
}
