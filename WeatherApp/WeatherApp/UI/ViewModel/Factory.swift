//
//  ViewModelFactory.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//
import DDModules
import Foundation

protocol Factory {
    static func createWFVM() -> WeatherForecastViewModel
}

class Dependencies : Factory, ObservableObject{
    static func createWFVM() -> WeatherForecastViewModel {
        return WeatherForecastViewModel(dataManager: DDModulesDependencies.createDataManager())
    }
    
}


