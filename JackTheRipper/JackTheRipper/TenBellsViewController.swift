//
//  TenBellsViewController.swift
//  JackTheRipper
//
//  Created by Jay Issuree on 04/12/2019.
//  Copyright © 2019 Team6. All rights reserved.
//

import MapKit
import UIKit
import UserNotifications

class TenBellsViewController: MapViewController {
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
        locationManager.stopMonitoring(for: geoFenceRegion5)
        locationManager.startMonitoring(for: geoFenceRegion6)
        
        super.viewDidLoad()
        
//        self.navigationItem.rightBarButtonItem?.isEnabled = false

        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
        
        let centerlocation = CLLocationCoordinate2D(latitude: 51.517762,
            longitude: -0.068449)

        let span = MKCoordinateSpan(latitudeDelta: 0.025, longitudeDelta: 0.025)
        let region = MKCoordinateRegion(center: centerlocation, span: span)
            mapView.setRegion(region, animated: true)

        let location6 = CLLocationCoordinate2D(latitude: 51.519393,
            longitude: -0.074271)

        let annotation6 = MKPointAnnotation()
        annotation6.coordinate = location6
        annotation6.title = "10 Bells Public House"
        annotation6.subtitle = "Spitalfields"
        mapView.addAnnotation(annotation6)
        
    }
    
        func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
            endgamealert()
                 }
                     
        func endgamealert() {
                     
            let alert = UIAlertController(title: "Comiserations!", message: "Jack the Ripper is still at large", preferredStyle: .alert)
            let action = UIAlertAction(title: "Enjoy a drink at his local pub", style: .default)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            self.navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let Info6ViewController = segue.destination as? Info6ViewController {
                  Info6ViewController.score = game?.score;
                  Info6ViewController.name = game?.title
              }
          }
    
    @IBOutlet weak var mapView: MKMapView!
    
}
