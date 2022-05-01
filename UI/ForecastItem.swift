//
//  ForecastItem.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import SwiftUI

struct ForecastItem: View {
    var body: some View {
        VStack{
            Divider()
                .background(.white)
            HStack{
                Text("Today")
                    .font(.title)
                Image(systemName: "cloud")
                    .padding()
                Spacer()
                Text("14")
                    .font(.system(size: HoursItemColumn.tempTextSize))
                + Text("O")
                    .font(.system(size: 8.0))
                    .baselineOffset(HoursItemColumn.tempTextSize/2)
            }
        }
    }
}

struct ForecastItem_Previews: PreviewProvider {
    static var previews: some View {
        ForecastItem()
    }
}
