//
//  Map5ViewController.swift
//  JackTheRipper
//
//  Created by Jay Issuree on 27/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import MapKit
import UIKit
import UserNotifications

class Map5ViewController: MapViewController {
    var score: Int? = nil
    var name: String? = nil
    var game : Game?
    
    override func viewDidLoad() {
        
        game = Game()
        game?.title = name ?? "Error"
        game?.score = score ?? 0
        
        locationManager.stopMonitoring(for: geoFenceRegion1)
        locationManager.stopMonitoring(for: geoFenceRegion2)
        locationManager.stopMonitoring(for: geoFenceRegion3)
        locationManager.stopMonitoring(for: geoFenceRegion4)
        locationManager.startMonitoring(for: geoFenceRegion5)
        
           super.viewDidLoad()
           // Do any additional setup after loading the view.
        
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
            annotation2.title = "Annie Chapman"
            annotation2.subtitle = "08/09/1888"
            mapView.addAnnotation(annotation2)
        
            
            let location3 = CLLocationCoordinate2D(latitude: 51.513959,
                longitude: -0.065441)
            
            let annotation3 = MKPointAnnotation()
            annotation3.coordinate = location3
            annotation3.title = "Elizabeth Stride"
            annotation3.subtitle = "30/09/1888"
            mapView.addAnnotation(annotation3)
        
        
            let location4 = CLLocationCoordinate2D(latitude: 51.514020,
                longitude: -0.076786)
            
            let annotation4 = MKPointAnnotation()
            annotation4.coordinate = location4
            annotation4.title = "Catherine Eddowes"
            annotation4.subtitle = "30/09/1888"
            mapView.addAnnotation(annotation4)
            
        
            let location5 = CLLocationCoordinate2D(latitude: 51.519076,
                longitude: -0.075825)
            
            let annotation5 = MKPointAnnotation()
            annotation5.coordinate = location5
            annotation5.title = "Victim 5"
            annotation5.subtitle = "Spitalfields"
            mapView.addAnnotation(annotation5)
                     
            }
                 
        func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
            crimescene5entered()
                 }
                     
        func crimescene5entered() {
                     
                let alert = UIAlertController(title: "You arrive at the crimescene", message: "On the floor lays the bloody corpse of a young woman", preferredStyle: .alert)
                let action = UIAlertAction(title: "Investigate the area for clues", style: .default) { (action) -> Void in
                let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "Info5")
                    self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
                     }
                    alert.addAction(action)
                    self.present(alert, animated: true, completion: nil)
                     
                 }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let Map5ViewController = segue.destination as? Map5ViewController {
            Map5ViewController.score = game?.score;
            Map5ViewController.name = game?.title
        }
    }


    @IBOutlet weak var mapView: MKMapView!
            
            
            
}
