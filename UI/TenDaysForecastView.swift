//
//  TenDaysForecastView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import SwiftUI

struct TenDaysForecastView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            HStack{
                Image(systemName: "calendar")
                    .foregroundColor(Color.white)
                Text("10-Day Forecast")
                    .foregroundColor(Color.white)
            }.padding()

            ForEach(0..<3){ _ in
                ForecastItem()
                     .listRowBackground(Color.clear)
                ForecastItem()
                     .listRowBackground(Color.clear)
                ForecastItem()
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
