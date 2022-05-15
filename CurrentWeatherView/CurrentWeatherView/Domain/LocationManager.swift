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
    @Published var locality:String = ""
    let geocoder = CLGeocoder()
    
    static let shared = LocationManager()
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else { return }
        geocoder.reverseGeocodeLocation(location, completionHandler: {[unowned self] placemarks, error in
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            // City
            if let city = placeMark.locality {
                print("city \(city)")
                locality = city
            }
            
        })

        
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
          case .restricted, .denied:
             // Disable your app's location features
             print("Denied")
             break
                
          case .authorizedWhenInUse:
             // Enable your app's location features.
            print("enabled")
            locationManager.startUpdatingLocation()
             break
                
          case .authorizedAlways:
             // Enable or prepare your app's location features that can run any time.
             print("enabled")
            locationManager.startUpdatingLocation()
             break
                
          case .notDetermined:
             break
        @unknown default:
            fatalError()
        }
    }
}

