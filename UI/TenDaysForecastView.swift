//
//  TenDaysForecastView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import SwiftUI

struct TenDaysForecastView: View {
    @EnvironmentObject var vm: WeatherForecastViewModel
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            HStack{
                Image(systemName: "calendar")
                    .foregroundColor(Color.white)
                Text("10-Day Forecast")
                    .foregroundColor(Color.white)
            }.padding()

            ForEach(vm.weatherResponse?.forecast.forecastday ?? [Forecastday](), id: \.day.condition.code){ forecastday in
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
