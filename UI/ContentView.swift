//
//  ContentView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import SwiftUI

struct ContentView: View {
 
    @StateObject var vm = WeatherForecastViewModel(remoteDataManager: RemoteDataManager())
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
                CurrentWeatherInfoView()
                HourlyForecastView()
                TenDaysForecastView()
            }
           
            
        }.ignoresSafeArea()
            .background(
                Image("cloud")
                    .resizable()
                    .scaledToFill()
                    .background(Color.black)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)
            )
            .environmentObject(vm)
           
            
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
