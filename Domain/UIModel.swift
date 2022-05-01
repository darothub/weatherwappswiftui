//
//  UIModel.swift
//  WeatherApp
//
//  Created by Darot on 01/05/2022.
//

import Foundation
enum UIModel {

     struct Content {
         let weatherforecast: WeatherResponse
     }

     case loading
     case content(Content)
     case error(String)
}
