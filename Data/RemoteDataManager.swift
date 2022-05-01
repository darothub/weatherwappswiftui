//
//  FetchDataFromRemote.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//
import Alamofire
import Foundation
class RemoteDataManager : ApiServices{    
    func fetchWeatherForecast(key:String, in q: String, for days:Int) -> DataRequest{
        let parameters:[String: Any] = [
            "key" : Constant.apikey,
            "q" : q,
            "days" : days
        ]
        let request = AF.request(Constant.baseUrl, method: .get, parameters: parameters)
        return request
    }
}
