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
    
    func getWeatherData(key:String, q: String, days:Int) -> DataRequest{
        return remoteDataManager.fetchWeatherForecast(key: key, in: q, for: days)
    }
}
