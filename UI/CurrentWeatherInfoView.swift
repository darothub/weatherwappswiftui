//
//  CurrentWeatherSummaryView.swift
//  WeatherApp
//
//  Created by Darot on 27/04/2022.
//
import Combine
import SwiftUI

struct CurrentWeatherInfoView: View {
    @EnvironmentObject var vm: WeatherForecastViewModel
    var body: some View {
        VStack{
            Text(vm.weatherResponse?.location.name ?? "..." )
                .font(.title)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            Text(String(format: "%.1f", vm.weatherResponse?.current.tempC ?? 0))
                .font(.system(size: 100))
            + Text("O")
                .font(.title)
                .baselineOffset(100/2)
            Text(vm.weatherResponse?.current.condition.text ?? "cool")
                .font(.title2)
        }
    }
    
}

struct CurrentWeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherInfoView()
    }
}
