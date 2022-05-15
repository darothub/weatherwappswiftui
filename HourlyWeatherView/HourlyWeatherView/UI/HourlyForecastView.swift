//
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Darot on 27/04/2022.
//

import SwiftUI

struct HourlyForecastView: View {
    @EnvironmentObject private var content: UIModel.ContentViewModel<WeatherResponse>
    let listOfHoursItemColumn = [HoursItemColumn()]
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            Text(content.data.current.condition.text )
                .font(.body)
                .padding()
                .foregroundColor(Color.white)
            Divider()
                .background(.white)
                Spacer()
            ScrollView (.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                     ForEach(content.data.forecast.forecastday.first?.hour ?? [Hours](), id: \.timeEpoch){ hour in
                         let date = Date(timeIntervalSince1970: TimeInterval(hour.timeEpoch))
                         let theHour = convertTimeIntervalToHour(epochTime: date)
                         let currentHour = convertTimeIntervalToHour(epochTime: Date())
                         if theHour >= currentHour {
                             HoursItemColumn(dayNum:"\(theHour)", temp: "\(hour.tempC)", imageUrl:hour.condition.icon)
                         }
                     }
                 }
                 .padding()
            }
    
        }
        .frame(height: 200)
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .opacity(0.5)
        .cornerRadius(10)
        .padding()
        
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView()
    }
}
