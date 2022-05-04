//
//  LandingView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//
import Combine
import SwiftUI

struct LandingView: View {
    @StateObject var vm = WeatherForecastViewModel(remoteDataManager: RemoteDataManager())
    @State var str = "Location"
    @StateObject var lm: LocationManager = LocationManager.shared
    @State var locality:String = "Kenya"
    @State var tokens: Set<AnyCancellable> = []
    var imageUrl = "//cdn.weatherapi.com/weather/64x64/day/176.png"
    var body: some View {
        NavigationView{
            TabView {
                ContentView()
                    .searchable(text: $str)
                    .onSubmit(of: .search) {
                        if !str.isEmpty {
                            getWeatherForecast(for: str)
                        }
                    }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .ignoresSafeArea()
            .background(
                AsyncImage(url: URL(string:"https:"+(vm.weatherResponse?.current.condition.icon ?? imageUrl))) { image in
                    image.resizable()
                        .scaledToFill()
                        .background(Color.black)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.5)
                } placeholder: {
                    Image("cloud")
                        .resizable()
                        .scaledToFill()
                        .background(Color.black)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.5)
                }
            ).navigationBarTitleDisplayMode(.inline)
                
            
            
            
        }
        .onAppear{
            observeCoordinateUpdates()
        }
        .environmentObject(vm)
        
        
    }
    func observeCoordinateUpdates() {
        lm.locationPublisher
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { locality in
                self.locality = locality
                print("locality \(lm.locality)")
                getWeatherForecast(for: locality)
            }
            .store(in: &tokens)
    }
    func getWeatherForecast(for locality:String) {
        vm.getWeatherForecasts(key:Constant.apikey, q:locality , days:7)
    }
    
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
