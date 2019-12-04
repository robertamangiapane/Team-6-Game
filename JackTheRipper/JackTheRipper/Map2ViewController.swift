//
//  Map2ViewController.swift
//  JackTheRipper
//
//  Created by Jay Issuree on 27/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import MapKit
import UIKit
import UserNotifications

class Map2ViewController: MapViewController {
    var game : Game?
    var score: Int? = nil
    var name: String? = nil

    override func viewDidLoad() {
        
        locationManager.stopMonitoring(for: geoFenceRegion1)
        locationManager.startMonitoring(for: geoFenceRegion2)
        
           super.viewDidLoad()
           // Do any additional setup after loading the view.
        game = Game()
        game?.title = name ?? "Error"
        game?.score = score ?? 0
        
//        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
       locationManager.delegate = self
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
            annotation1.title = "Mary Ann Nichols"
            annotation1.subtitle = "31/08/1888"
            mapView.addAnnotation(annotation1)
        
            
            let location2 = CLLocationCoordinate2D(latitude: 51.520415,
                longitude: -0.072553)
            
            let annotation2 = MKPointAnnotation()
            annotation2.coordinate = location2
            annotation2.title = "Victim 2"
            annotation2.subtitle = "Spitalfields"
            mapView.addAnnotation(annotation2)
             
             }
         
         func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
            crimescene2entered()
         }
             
         func crimescene2entered() {
             
             let alert = UIAlertController(title: "You arrive at the crimescene", message: "The body of Annie Chapman was discovered by a market porter just after 6 A.M. on September 8, 1888.", preferredStyle: .alert)
             let action = UIAlertAction(title: "Investigate the area for clues", style: .default)
             alert.addAction(action)
             self.present(alert, animated: true, completion: nil)
             self.navigationItem.rightBarButtonItem?.isEnabled = true
             
         }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let Info2ViewController = segue.destination as? Info2ViewController {
               Info2ViewController.score = game?.score;
               Info2ViewController.name = game?.title
           }
       }
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    }
