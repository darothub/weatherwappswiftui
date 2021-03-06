//
//  TenDaysForecastView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import DDModules
import SwiftUI

struct TenDaysForecastView: View {
    @EnvironmentObject private var content: UIModel.ContentViewModel<WeatherResponse>
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            HStack{
                Image(systemName: "calendar")
                    .foregroundColor(Color.white)
                Text("10-Day Forecast")
                    .foregroundColor(Color.white)
            }.padding()

            ForEach(content.data.forecast.forecastday, id: \.hour.first?.timeEpoch){ forecastday in
                let forecastdate = Date(timeIntervalSince1970: TimeInterval(forecastday.dateEpoch))
                let dayOfTheWeekName = convertTimeIntervalToWeekdayName(epochTime: forecastdate)
                ForecastItem(dayOfTheWeek: dayOfTheWeekName, imageUrl: forecastday.day.condition.icon, temp: "\(forecastday.day.avgtempC)")
                     .listRowBackground(Color.clear)
            }.padding(.horizontal)
    
        }
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .opacity(0.5)
        .cornerRadius(10)
        .padding()
        
    }
}

struct TenDaysForecastView_Previews: PreviewProvider {
    static var previews: some View {
        TenDaysForecastView()
    }
}
