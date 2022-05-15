//
//  GetWeatherForecast.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Alamofire
import Foundation
public class GetWeatherForecast {
    let remoteDataManager: RemoteDataManager
    public init(remoteDataManager: RemoteDataManager){
        self.remoteDataManager = remoteDataManager
    }
    
    public func getWeatherData(q: String, days:Int) -> DataRequest{
        return remoteDataManager.fetchWeatherForecast(in: q, for: days)
    }
}

public class GetRemoteWeatherUseCase {
    let remoteRepository: RemoteRepository
    public  init(remoteRepository: RemoteRepository){
        self.remoteRepository = remoteRepository
    }
    
    func getRemoteWeather(q: String, days: Int) -> DataRequest{
        return remoteRepository.getWeatherData(q: q, days:days)
    }
}

public class GetLocalWeatherUseCase {
    let remoteRepository: RemoteRepository
    public init(remoteRepository: RemoteRepository){
        self.remoteRepository = remoteRepository
    }
    
    public func getRemoteWeather(q: String, days: Int) -> DataRequest{
        return remoteRepository.getWeatherData(q: q, days:days)
    }
}


