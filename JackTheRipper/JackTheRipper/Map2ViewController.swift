//
//  Map2ViewController.swift
//  JackTheRipper
//
//  Created by Jay Issuree on 27/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import MapKit
import UIKit

class Map2ViewController: UIViewController {

     override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            let location = CLLocationCoordinate2D(latitude: 51.520415,
                longitude: -0.072553)
            
            // 2
            let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
            let region = MKCoordinateRegion(center: location, span: span)
                mapView.setRegion(region, animated: true)
                
            //3
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Victim 2"
            annotation.subtitle = "Spitalfields"
            mapView.addAnnotation(annotation)
            
        
        }


    @IBOutlet weak var mapView: MKMapView!
    
    
    
    }
