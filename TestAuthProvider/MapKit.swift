//
//  MapKit.swift
//
//
//  Created by Deniz on 6/3/19.
//

/*

import UIKit
import MapKit
import CoreLocation

class MapKit : UIViewController {
    let locationManager = CLLocationManager()
  @IBOutlet weak var mapView: MKMapView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = (self as CLLocationManagerDelegate)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}

extension MapKit : CLLocationManagerDelegate {
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    private func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error:: \(error)")
    }
}

 
 
 */
