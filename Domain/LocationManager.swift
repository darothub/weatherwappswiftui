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
    @Published var region: MKCoordinateRegion = MKCoordinateRegion.defaultRegion()
    @Published var locality:String = "..."
//    var locationPublisher = PassthroughSubject<String, Error>()
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
//                print(city)
                locality = city
//                locationPublisher.send(city)
            }
            
        })

        
    }
}


extension MKCoordinateRegion {
    
    static func defaultRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 29.726819, longitude: -95.393692), latitudinalMeters: 100, longitudinalMeters: 100)
    }
    
}
