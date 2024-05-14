//
//  MapViewController.swift
//  JRNL
//
//  Created by 어재선 on 5/14/24.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
        self.navigationItem.title = "Loding..."
        locationManger.requestLocation()

    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let myLocation = locations.first {
            let lat = myLocation.coordinate.latitude
            let long = myLocation.coordinate.longitude
            self.navigationItem.title = "Map"
            mapView.region = setInitialRegion(lat: lat, long: long)
            
        }
    }
    
    // MARK: - Methods
    func setInitialRegion(lat: CLLocationDegrees, long:CLLocationDegrees) -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: long), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    }

}
