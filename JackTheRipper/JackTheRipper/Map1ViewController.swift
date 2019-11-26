//
//  Map1ViewController.swift
//  JackTheRipper
//
//  Created by Heli Sivunen on 26/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//
import MapKit
import UIKit

class Map1ViewController: UIViewController {

     override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            let location = CLLocationCoordinate2D(latitude: 51.520045,
                longitude: -0.060630)
            
            // 2
            let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
            let region = MKCoordinateRegion(center: location, span: span)
                mapView.setRegion(region, animated: true)
                
            //3
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Victim 1"
            annotation.subtitle = "Whitechapel"
            mapView.addAnnotation(annotation)
            
        
        }


    @IBOutlet weak var mapView: MKMapView!
    
    }
