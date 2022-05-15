//
//  RemoteWeatherRequest.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Alamofire
import Foundation
class RemoteWeatherRepo : RemoteRepository {
    
    let apiService: ApiServices
    init(apiService: ApiServices){
        self.apiService = apiService
    }
    
    func getWeatherForecast(q: String, days: Int = 7, onCompletion: @escaping (Result<WeatherRealm, NetworkError>) -> Void) {
        apiService.fetchWeatherForecast(in: q, for: days)
            .responseDecodable(of: WeatherRealm.self){ res in
                switch res.result {
                case .failure(_):
                    onCompletion(.failure(.networkError))
                case let .success(weatherResponse):
                    onCompletion(.success(weatherResponse))
                }
                
            }            
    }
    
    
    func getWeatherData(q: String, days:Int) -> DataRequest{
        return apiService.fetchWeatherForecast(in: q, for: days)
    }

    
}
