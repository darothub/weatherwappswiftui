//
//  DataManager.swift
//  WeatherApp
//
//  Created by Darot on 06/05/2022.
//
import Combine
import Foundation

class DataManager : ObservableObject{
    static let LOCALITY = "locality"
    let remoteWeatherRepo: RemoteWeatherRepo
    let locationManager: LocationManager
    let localRepository : LocalRepository
    @Published public var data:WeatherRealm!
    private var lastQuery = UserDefaults.standard.string(forKey: LOCALITY)
    private var subscriptions = Set<AnyCancellable>()
    init(remoteWeatherRepo: RemoteWeatherRepo, locationManager: LocationManager, localRepository : LocalRepository){
        self.remoteWeatherRepo = remoteWeatherRepo
        self.locationManager = locationManager
        self.localRepository = localRepository
        observeLocaldata()
    }
    
    fileprivate func getRemoteWeatherForecast(query:String){
        remoteWeatherRepo.getWeatherForecast(q: query, days: 7) { result in
            switch result {
            case .failure(_): 
                print("failed")
            case let .success(weatherRealm):
                self.localRepository.saveWeatherForecast(weather: weatherRealm)
            }
        }
    }
    
    func getLocalData(q: String, days:Int, sendDataToView: @escaping (WeatherRealm?) -> Void){
        UserDefaults.standard.set(q, forKey: Constant.LOCALITY)
        localRepository.getLocalWeather(q: q, days: days) { [unowned self] dataWeatherRealm in
            if dataWeatherRealm != nil {
                observeLocaldata()
            }
            else {
                print("No data calling remote...")
                getRemoteWeatherForecast(query: q)
            }
        }
    }
    

    
    func getDefaultLocation(onCompletion: @escaping (String) -> Void){
        self.locationManager.$locality
            .receive(on: DispatchQueue.main)
            .sink{completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { locality in
                onCompletion(locality)
             
            }
            .store(in: &subscriptions)
    }
    
    func observeLocaldata() {
        (localRepository as! LocalWeatherRepoImpl).$data.sink{completion in
                print("Handle \(completion) for error and finished subscription.")
        } receiveValue: { [unowned self] d in
                if d != nil {
                   data = d
                }
            }
            .store(in: &subscriptions)
    }
}

enum Constant{
    static let LOCALITY = "locality"
}
