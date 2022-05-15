//
//  RemoteWeatherRequest.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Alamofire
import Foundation
public class RemoteWeatherRepo : RemoteRepository {
    
    let apiService: ApiServices
    public init(apiService: ApiServices){
        self.apiService = apiService
    }
    
    public func getWeatherForecast(q: String, days: Int = 7, onCompletion: @escaping (Result<WeatherRealm, NetworkError>) -> Void) {
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
    
    
    public func getWeatherData(q: String, days:Int) -> DataRequest{
        return apiService.fetchWeatherForecast(in: q, for: days)
    }

    
}
