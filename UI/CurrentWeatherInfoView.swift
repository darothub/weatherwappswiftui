//
//  CurrentWeatherSummaryView.swift
//  WeatherApp
//
//  Created by Darot on 27/04/2022.
//
import Combine
import SwiftUI

struct CurrentWeatherInfoView: View {
    @EnvironmentObject private var content: UIModel.ContentViewModel
    var body: some View {
        VStack{
            Text(content.weatherforecast.location.name)
                .font(.title)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
              
            Text(String(format: "%.1f", content.weatherforecast.current.tempC))
                .font(.system(size: 100))
            + Text("O")
                .font(.title)
                .baselineOffset(100/2)
            Text(content.weatherforecast.current.condition.text)
                .font(.title2)
        }
    }
    
}

struct CurrentWeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherInfoView()
    }
}
