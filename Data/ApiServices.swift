//
//  FetchWeather.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//
import Alamofire
import Foundation
protocol ApiServices {
    func fetchWeatherForecast(in q: String,  for days:Int) -> DataRequest
}


enum Constant{
    static let baseUrl = "https://api.weatherapi.com/v1/forecast.json"
    static let apikey = "a3dcb83d3dca466c9a4155723220501"
}
