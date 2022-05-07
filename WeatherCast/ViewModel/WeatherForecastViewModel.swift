//
//  WeatherForecastViewModel.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Alamofire
import Combine
import Foundation
import SwiftUI
import Domain
final class WeatherForecastViewModel : ObservableObject {
    @Published var weatherResponse: WeatherResponse!
    @Published var stateData: UIModel = UIModel.loading
    @Published var locality = "..."
    private var subscriptions = Set<AnyCancellable>()
    private let dataManager: DataManager
    
  
    init(dataManager: DataManager){
        self.dataManager = dataManager
        getDefaultLocation()
    }
    
    func getWeatherForecasts(q: String, days:Int){
        let dataRequest = dataManager.remoteWeatherRepo.getWeatherData(q: q, days: days)
        dataRequest.publishDecodable(type: WeatherResponse.self)
            .receive(on: DispatchQueue.main)

            .sink{completion in
                switch completion {
                case .finished:
                    print("It is finished")
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
                
            } receiveValue: { [unowned self] data in
                if data.value != nil{
                    weatherResponse = data.value!
                    let ui = UIModel.content(UIModel.ContentViewModel(data: weatherResponse))
                    stateData = ui
                }
                
            }
        
            .store(in: &subscriptions)
        
    }
    
    func getDefaultLocation(){
        self.dataManager.locationManager.$locality
            .receive(on: DispatchQueue.main)
            .sink{completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { locality in
                print("Local \(locality)")
                self.locality = locality
            }
            .store(in: &subscriptions)
    }
}
