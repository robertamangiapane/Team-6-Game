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
            
            let location1 = CLLocationCoordinate2D(latitude: 51.520045,
                longitude: -0.060630)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.04, longitudeDelta: 0.04)
            let region = MKCoordinateRegion(center: location1, span: span)
                mapView.setRegion(region, animated: true)
                
            let annotation1 = MKPointAnnotation()
            annotation1.coordinate = location1
            annotation1.title = "Victim 1"
            annotation1.subtitle = "Whitechapel"
            mapView.addAnnotation(annotation1)
            
        
        }


    @IBOutlet weak var mapView: MKMapView!
    
    
    }
