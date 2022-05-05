//
//  ContentView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import Combine
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: WeatherForecastViewModel
    var body: some View {
        switch vm.stateData {
        case .loading:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        case .content (let content):
            ScrollView{
                VStack(spacing: 0){
                    CurrentWeatherInfoView()
                    HourlyForecastView()
                    TenDaysForecastView()
                    Text("\(content.weatherforecast.current.tempC)")
                }
            }.environmentObject(content)
        case .error(let message): Text("\(message)")
            // showError(message)
        }
    }


}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
