//
//  Map5ViewController.swift
//  JackTheRipper
//
//  Created by Jay Issuree on 27/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import MapKit
import UIKit

class Map5ViewController: UIViewController {
    
    fileprivate let locationManager:CLLocationManager = CLLocationManager()

    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       
       locationManager.requestWhenInUseAuthorization()
       locationManager.desiredAccuracy = kCLLocationAccuracyBest
       locationManager.distanceFilter = kCLDistanceFilterNone
       locationManager.startUpdatingLocation()
       
       mapView.showsUserLocation = true

            let centerlocation = CLLocationCoordinate2D(latitude: 51.517762,
                longitude: -0.068449)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
            let region = MKCoordinateRegion(center: centerlocation, span: span)
                mapView.setRegion(region, animated: true)
        
            let location1 = CLLocationCoordinate2D(latitude: 51.520045,
                longitude: -0.060630)
                         
            let annotation1 = MKPointAnnotation()
            annotation1.coordinate = location1
            annotation1.title = "Victim 1"
            annotation1.subtitle = "Whitechapel"
            mapView.addAnnotation(annotation1)
        
            
            let location2 = CLLocationCoordinate2D(latitude: 51.520415,
                longitude: -0.072553)
            
            let annotation2 = MKPointAnnotation()
            annotation2.coordinate = location2
            annotation2.title = "Victim 2"
            annotation2.subtitle = "Spitalfields"
            mapView.addAnnotation(annotation2)
        
            
            let location3 = CLLocationCoordinate2D(latitude: 51.513959,
                longitude: -0.065441)
            
            let annotation3 = MKPointAnnotation()
            annotation3.coordinate = location3
            annotation3.title = "Victim 3"
            annotation3.subtitle = "Whitechapel"
            mapView.addAnnotation(annotation3)
        
        
            let location4 = CLLocationCoordinate2D(latitude: 51.514020,
                longitude: -0.076786)
            
            let annotation4 = MKPointAnnotation()
            annotation4.coordinate = location4
            annotation4.title = "Victim 4"
            annotation4.subtitle = "Aldgate"
            mapView.addAnnotation(annotation4)
            
        
            let location5 = CLLocationCoordinate2D(latitude: 51.519076,
                longitude: -0.075825)
            
            let annotation5 = MKPointAnnotation()
            annotation5.coordinate = location5
            annotation5.title = "Victim 5"
            annotation5.subtitle = "Spitalfields"
            mapView.addAnnotation(annotation5)
        
        }


    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    }
