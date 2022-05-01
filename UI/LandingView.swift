//
//  LandingView.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import SwiftUI

struct LandingView: View {

    var body: some View {
        TabView {
            ContentView()
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .ignoresSafeArea()
      

    }
    
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
