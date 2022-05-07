//
//  ViewModelFactory.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Foundation
import Domain
protocol Factory {
    static func createWFVM() -> WeatherForecastViewModel
}

class Dependencies : Factory, ObservableObject{
    static func createWFVM() -> WeatherForecastViewModel {
        return WeatherForecastViewModel(dataManager: DomainDependencies.createDataManager())
    }
}


