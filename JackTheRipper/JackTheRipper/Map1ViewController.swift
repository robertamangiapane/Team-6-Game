//
//  Map1ViewController.swift
//  JackTheRipper
//
//  Created by Heli Sivunen on 26/11/2019.
//  Copyright © 2019 Team6. All rights reserved.
//
import MapKit
import UIKit
import UserNotifications

class Map1ViewController: UIViewController, CLLocationManagerDelegate, UNUserNotificationCenterDelegate {
    
    fileprivate let locationManager:CLLocationManager = CLLocationManager()

     override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        
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

            let location1 = CLLocationCoordinate2D(latitude: 51.520045,
                longitude: -0.060630)

            let annotation1 = MKPointAnnotation()
            annotation1.coordinate = location1
            annotation1.title = "Victim 1"
            annotation1.subtitle = "Whitechapel"
            mapView.addAnnotation(annotation1)

            let geoFenceRegion:CLCircularRegion = CLCircularRegion(center: location1, radius: 10, identifier: "Victim 1")
            locationManager.startMonitoring(for: geoFenceRegion)
            

        }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for currentLocation in locations{
            print("\(index): \(currentLocation)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Arrived at: \(region.identifier)")
        vic1alert()
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Departed: \(region.identifier)")
//        vic1alert()
    }
    
    func vic1alert() {
        
        let alert = UIAlertController(title: "Success", message: "Logged In", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            let viewControllerYouWantToPresent = self.storyboard?.instantiateViewController(withIdentifier: "ChallengeLink")
            self.present(viewControllerYouWantToPresent!, animated: true, completion: nil)
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
        
    }



    @IBOutlet weak var mapView: MKMapView!
    
    
    }
