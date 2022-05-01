//
//  HourlyForecastView.swift
//  WeatherApp
//
//  Created by Darot on 27/04/2022.
//

import SwiftUI

struct HourlyForecastView: View {
    let listOfHoursItemColumn = [HoursItemColumn()]
    var body: some View {
        VStack(alignment:.leading, spacing: 0){
            Text("Rainy condition bla bla")
                .font(.body)
                .padding()
                .foregroundColor(Color.white)
            Divider()
                .background(.white)
                Spacer()
            ScrollView (.horizontal, showsIndicators: false) {
                 HStack {
                     ForEach(0..<4){ _ in
                         HoursItemColumn()
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
