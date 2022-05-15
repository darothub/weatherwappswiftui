//
//  LocalRepository.swift
//  WeatherApp
//
//  Created by Darot on 09/05/2022.
//

import Foundation
public protocol LocalRepository {
    func getLocalWeather(q:String, days:Int, onCompletion:  @escaping (WeatherRealm?) -> Void)
    func saveWeatherForecast(weather: WeatherRealm)
}
