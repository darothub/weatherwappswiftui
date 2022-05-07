//
//  LandingView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//
import Combine
import SwiftUI

struct LandingView: View {
    @StateObject var vm = Dependencies.createWFVM()
    @State var locality:String = ""
    @State var tokens: Set<AnyCancellable> = []
    var imageUrl = Constants.imagePlaceHolderUrl
    var body: some View {
        NavigationView{
            TabView {
                ContentView(vm: vm)
                    .searchable(text: $locality)
                    .onSubmit(of: .search) {
                        if !locality.isEmpty {
                            withAnimation(.easeIn) {
                                getWeatherForecast(for: $locality)
                            }
                          
                        }
                    }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .ignoresSafeArea()
            .navigationBarTitleDisplayMode(.inline)
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
            )
            .task {
                withAnimation(.easeIn) {
                    observeCoordinateUpdates()
                }
               
            }
                
        }.environmentObject(vm)
        
        
    }
    func observeCoordinateUpdates() {
        vm.$locality
            .receive(on: DispatchQueue.main)
            .sink{completion in
                print("Handle \(completion) for error and finished subscription.")
            } receiveValue: { locality in
                self.locality = locality
                getWeatherForecast(for: $locality)
            }
            .store(in: &tokens)
    }
    func getWeatherForecast(for locality:Binding<String>) {
//        print("Loc \(locality.wrappedValue)")
        vm.getWeatherForecasts(q:locality.wrappedValue , days:4)
    }
    
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
