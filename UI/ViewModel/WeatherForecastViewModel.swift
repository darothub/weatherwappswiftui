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
final class WeatherForecastViewModel : ObservableObject {
    @Published var weatherResponse: WeatherResponse!
    @State var locality = ""
    private var subscriptions = Set<AnyCancellable>()
    private let getWeatherForecast:GetWeatherForecast
    private let remoteDataManager: RemoteDataManager
    
  
    init(remoteDataManager: RemoteDataManager){
        self.remoteDataManager = remoteDataManager
        self.getWeatherForecast = GetWeatherForecast(remoteDataManager: remoteDataManager)
    }
    
    func getWeatherForecasts(key:String, q: String, days:Int){
        let dataRequest = getWeatherForecast.getWeatherData(key: key, q: q, days: days)
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
//                print("data \(data)")
                if data.value != nil{
                    weatherResponse = data.value!
                }
                
            }.store(in: &subscriptions)
    }
}
