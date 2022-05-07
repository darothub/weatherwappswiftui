//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Darot on 02/05/2022.
//
import CoreLocation
import Foundation
import MapKit
import Combine
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var location: CLLocation?
    @Published var locality:String = "..."
    let geocoder = CLGeocoder()
    
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        requestLocationUpdates()
        locationManager.delegate = self
    }
    
    func requestLocationUpdates() {
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            
        default:
            self.locality = "Error"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        geocoder.reverseGeocodeLocation(location, completionHandler: {[unowned self] placemarks, error in
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            // City
            if let city = placeMark.locality {
                locality = city
            }
            
        })

        
    }
}

