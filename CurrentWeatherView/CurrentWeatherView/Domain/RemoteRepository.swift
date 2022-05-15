//
//  RemoteRepository.swift
//  WeatherApp
//
//  Created by Darot on 09/05/2022.
//

import Alamofire
import Foundation

protocol RemoteRepository {
    func getWeatherData(q: String, days:Int) -> DataRequest
}
