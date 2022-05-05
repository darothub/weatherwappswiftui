//
//  UIModel.swift
//  WeatherApp
//
//  Created by Darot on 01/05/2022.
//

import Foundation
import SwiftUI
enum UIModel {

    class ContentViewModel : ObservableObject {
        @Published var weatherforecast: WeatherResponse
        init(weatherforecast: WeatherResponse){
            self.weatherforecast = weatherforecast
        }
        
    }

    case loading
    case content(ContentViewModel)
    case error(String)
}


func convertTimeIntervalToHour(epochTime date:Date?) -> Int{
    let thisDate  = date ?? Date()
    let calendar = Calendar.current
    let theHour = calendar.component(.hour, from: thisDate)
    return theHour
}

func convertTimeIntervalToWeekdayName(epochTime date:Date?) -> String{
    let df = DateFormatter()
    let thisDate  = date ?? Date()
    let calendar = Calendar.current
    let theWeekDay = calendar.component(.weekday, from: thisDate)
    let thisWeekDay = calendar.component(.weekday, from: Date())
    guard thisWeekDay != theWeekDay else {
        return "Today"
    }
    return df.weekdaySymbols[theWeekDay - 1]
}
