//
//  ViewModelFactory.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Foundation

protocol Factory {
 
    static func createRemoteWeatherRepo() -> RemoteWeatherRepo
    static func createLocationManager() -> LocationManager
    static func createRemoteDataManager() -> RemoteDataManager
    static func createDataManager() -> DataManager
}

public class DDModulesDependencies : Factory, ObservableObject{
    public static func createDataManager() -> DataManager {
        return DataManager(
            remoteWeatherRepo: createRemoteWeatherRepo(),
            locationManager: createLocationManager(),
            localRepository: createLocalRepository()
        )
    }
    public static func createRemoteWeatherRepo() -> RemoteWeatherRepo {
        RemoteWeatherRepo(apiService: createRemoteDataManager())
    }
    
    public static func createLocationManager() -> LocationManager {
        return LocationManager.shared
    }
    public static func createRemoteDataManager() -> RemoteDataManager {
        return RemoteDataManager()
    }
    public static func createGetWeatherForecast() -> GetWeatherForecast{
        return GetWeatherForecast(remoteDataManager: createRemoteDataManager())
    }
    
    public static  func createGetRemoteWeatherUseCase() -> GetRemoteWeatherUseCase{
        return GetRemoteWeatherUseCase(remoteRepository: createRemoteWeatherRepo())
    }
    
    public static func createLocalRepository() -> LocalRepository {
        return LocalWeatherRepoImpl()
    }
    
}


