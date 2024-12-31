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
        
        GMSServices.provideAPIKey("AIzaSyDrUlZt62YkPWakLIazIMbSdGWTjSYuMyQ")
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        self.view.addSubview(mapView)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
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

}

