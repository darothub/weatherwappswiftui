//
//  LocalWeatherRepoImpl.swift
//  WeatherApp
//
//  Created by Darot on 15/05/2022.
//
import Combine
import Foundation
import RealmSwift
class LocalWeatherRepoImpl : ObservableObject, LocalRepository {
 
    @Published public var data:WeatherRealm!
    @ObservedResults(WeatherRealm.self) var weatherRealm
    
    func getLocalWeather(q query: String, days: Int, onCompletion: @escaping (WeatherRealm?) -> Void ) {
        data = $weatherRealm.wrappedValue.first { weather in
            weather.location?.name == query || weather.location?.country == query
        }
        onCompletion(data)
     
    }
    
    func saveWeatherForecast(weather: WeatherRealm){
        if (weather.location != nil && weather.current != nil && weather.forecast != nil){
           
            $weatherRealm.append(weather)
            data = weather
          
        }
    }
}
