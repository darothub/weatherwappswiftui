//
//  WeatherForecastViewModel.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//


import Combine
import DDModules
import Foundation
import SwiftUI
import RealmSwift
final class WeatherForecastViewModel : ObservableObject {
//    @State private var lastQuery = UserDefaults.standard.string(forKey: Constant.LOCALITY)
    @AppStorage(Constant.LOCALITY) private var lastQuery = ""
    @Published var weatherResponse: WeatherResponse!
    @Published var stateData: UIModel = UIModel.loading
    @Published var locality = ""
    @Published public var data:WeatherRealm!
    private var subscriptions = Set<AnyCancellable>()
    private let dataManager: DataManager
    
    init(dataManager: DataManager){
        self.dataManager = dataManager
        getDefaultLocation()
        observeLocaldata()
    }
    
    
    func getData(query:String, days:Int = 7){
        print("`query` \(String(describing: query))")
        UserDefaults.standard.set(query, forKey:  Constant.LOCALITY)
        dataManager.getLocalData(q: query, days: days) { [unowned self] weatherRealm in
            sendDataToView(weather: weatherRealm!)
        }
    }
    
    
    func observeLocaldata() {
        dataManager.$data.sink{completion in
                print("Handle \(completion) for error and finished subscription.")
        } receiveValue: { [unowned self] d in
                if d != nil {
                    sendDataToView(weather: d!)
                }
            }
            .store(in: &subscriptions)
    }
    
    func getDefaultLocation(){
        let lastQ = UserDefaults.standard.string(forKey: Constant.LOCALITY)
        print("lastQ \(String(describing: lastQuery))")
        
        dataManager.getDefaultLocation { [unowned self] localitu in
            print("default location is \(localitu)")
         
            if lastQuery == ""  {
                print("getting default location")
                print("lastQ \(String(describing: lastQuery))")
                getData(query: localitu)
            }
            else{
                print("real lastQ \(String(describing: lastQ))")
                getData(query: lastQuery)
            }
        }
      
    }
    
    fileprivate func sendDataToView(weather: WeatherRealm){
        if (weather.location != nil && weather.current != nil && weather.forecast != nil){
           
            self.weatherResponse = WeatherResponse(weather: weather)
            let ui = UIModel.content(UIModel.ContentViewModel(data: weatherResponse))
            self.stateData = ui
           
        }
    }
    
}



enum Constant{
    static let LOCALITY = "locality"
}
