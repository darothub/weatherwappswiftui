//
//  HoursItemColumn.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import SwiftUI

struct HoursItemColumn: View {
    static var tempTextSize = 25.0
    var body: some View {
        VStack(spacing:20){
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Image("cloud")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .scaledToFill()
            Text("14")
                .font(.system(size: HoursItemColumn.tempTextSize))
            + Text("O")
                .font(.system(size: 8.0))
                .baselineOffset(HoursItemColumn.tempTextSize/2)
            
        }
    }
}

struct HoursItemColumn_Previews: PreviewProvider {
    static var previews: some View {
        HoursItemColumn()
    }
}
