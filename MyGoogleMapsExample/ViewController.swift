//
//  ViewController.swift
//  MyGoogleMapsExample
//
//  Created by Elexoft on 30/12/2024.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLocationManager()
        
        // Added the Api key for the Google map
        GMSServices.provideAPIKey("AIzaSyDrUlZt62YkPWakLIazIMbSdGWTjSYuMyQ")
        
        // Printing the license of the google services of map we are using
        print("License: \n\n\(GMSServices.openSourceLicenseInfo())")
        
    }

    func setupLocationManager() {
        locationManager.delegate = self
        // Request the location from the user
        locationManager.requestWhenInUseAuthorization()
        // Start the location tracking
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let userLocation = locations.first else {return}
        let coordinate = userLocation.coordinate
        
        // Create a GMSCameraPosition that tells the map to display the
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 1.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        // marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
        marker.position = coordinate
        marker.title = "London"
        marker.snippet = "UK"
        marker.map = mapView
        
    }

}

