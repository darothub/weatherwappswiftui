//
//  GetWeatherForecast.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Alamofire
import Foundation
class GetWeatherForecast {
    let remoteDataManager: RemoteDataManager
    init(remoteDataManager: RemoteDataManager){
        self.remoteDataManager = remoteDataManager
    }
    
    func getWeatherData(q: String, days:Int) -> DataRequest{
        return remoteDataManager.fetchWeatherForecast(in: q, for: days)
    }
}

class GetRemoteWeatherUseCase {
    let remoteRepository: RemoteRepository
    init(remoteRepository: RemoteRepository){
        self.remoteRepository = remoteRepository
    }
    
    func getRemoteWeather(q: String, days: Int) -> DataRequest{
        return remoteRepository.getWeatherData(q: q, days:days)
    }
}

class GetLocalWeatherUseCase {
    let remoteRepository: RemoteRepository
    init(remoteRepository: RemoteRepository){
        self.remoteRepository = remoteRepository
    }
    
    func getRemoteWeather(q: String, days: Int) -> DataRequest{
        return remoteRepository.getWeatherData(q: q, days:days)
    }
}


