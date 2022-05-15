//
//  CurrentWeatherSummaryView.swift
//  WeatherApp
//
//  Created by Darot on 27/04/2022.
//
import Combine
import SwiftUI
public struct CurrentWeatherInfoView: View {
    @EnvironmentObject private var content: UIModel.ContentViewModel<WeatherResponse>
    public init(){}
    public var body: some View {
        VStack{
            Text(content.data.location.name)
                .font(.title)
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
            Text(String(format: "%.1f", content.data.current.tempC))
                .font(.system(size: 100))
            + Text("O")
                .font(.title)
                .baselineOffset(100/2)
            Text(content.data.current.condition.text)
                .font(.title2)
                
        }
       
    }
    
}

struct CurrentWeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherInfoView()
    }
}
