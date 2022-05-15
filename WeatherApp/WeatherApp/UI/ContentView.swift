//
//  ContentView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import Combine
import SwiftUI

struct ContentView: View {
    @StateObject var vm: WeatherForecastViewModel

    var body: some View {
        switch vm.stateData {
        case .loading:
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        case .content (let content):
            ScrollView{
                VStack(spacing: 0){
                    CurrentWeatherInfoViews()
                    HourlyForecastView()
                    TenDaysForecastView()
                    Text("\((content.data).current.tempC)")
                }
                .animation(.default, value: content.data)
            }.environmentObject(content)
        case .error(let message): Text("\(message)")
            // showError(message)
        }
    }


}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(vm: Dependencies.createWFVM())
    }
}
