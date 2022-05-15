//
//  LandingView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//


import Combine
import DDModules
import SwiftUI

struct LandingView: View {
    static let LOCALITY = "locality"
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
                        vm.getData(query: locality)
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
                
        }.environmentObject(vm)
       
       
    }
    

    
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
