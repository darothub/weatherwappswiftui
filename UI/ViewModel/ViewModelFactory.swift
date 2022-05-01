//
//  ViewModelFactory.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Foundation

protocol ViewModelFactory {
     func createWFVM() -> WeatherForecastViewModel
}

class Dependencies : ViewModelFactory, ObservableObject{
    func createWFVM() -> WeatherForecastViewModel {
        return WeatherForecastViewModel(remoteDataManager: createRemoteDataManager())
    }
    fileprivate func createRemoteDataManager() -> RemoteDataManager {
        return RemoteDataManager()
    }
    fileprivate func createGetWeatherForecast() -> GetWeatherForecast{
        return GetWeatherForecast(remoteDataManager: createRemoteDataManager())
    }
    
}


class TestSomething : ObservableObject{
    @Published var love = "Lovee"
}
