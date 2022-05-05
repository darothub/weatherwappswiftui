//
//  RemoteWeatherRequest.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Alamofire
import Foundation
class RemoteWeatherRepo {
    let remoteDataManager: RemoteDataManager
    init(remoteDataManager: RemoteDataManager){
        self.remoteDataManager = remoteDataManager
    }
    
    func getWeatherData(q: String, days:Int) -> DataRequest{
        return remoteDataManager.fetchWeatherForecast(in: q, for: days)
    }
}
