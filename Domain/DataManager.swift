//
//  DataManager.swift
//  WeatherApp
//
//  Created by Darot on 06/05/2022.
//

import Foundation
class DataManager{
    let remoteWeatherRepo: RemoteWeatherRepo
    let locationManager: LocationManager
    init(remoteWeatherRepo: RemoteWeatherRepo, locationManager: LocationManager){
        self.remoteWeatherRepo = remoteWeatherRepo
        self.locationManager = locationManager
    }
}

