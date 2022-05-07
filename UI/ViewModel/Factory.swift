//
//  ViewModelFactory.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Foundation

protocol Factory {
    static func createWFVM() -> WeatherForecastViewModel
    static func createRemoteWeatherRepo() -> RemoteWeatherRepo
    static func createLocationManager() -> LocationManager
    static func createRemoteDataManager() -> RemoteDataManager
    static func createDataManager() -> DataManager
}

class Dependencies : Factory, ObservableObject{
    static func createDataManager() -> DataManager {
        return DataManager(remoteWeatherRepo: createRemoteWeatherRepo(),
                           locationManager: createLocationManager())
    }
    static func createWFVM() -> WeatherForecastViewModel {
        return WeatherForecastViewModel(dataManager: createDataManager())
    }
    static func createRemoteWeatherRepo() -> RemoteWeatherRepo {
        RemoteWeatherRepo(remoteDataManager: createRemoteDataManager())
    }
    
    static func createLocationManager() -> LocationManager {
        return LocationManager.shared
    }
    static func createRemoteDataManager() -> RemoteDataManager {
        return RemoteDataManager()
    }
    static fileprivate func createGetWeatherForecast() -> GetWeatherForecast{
        return GetWeatherForecast(remoteDataManager: createRemoteDataManager())
    }
    
    
}


