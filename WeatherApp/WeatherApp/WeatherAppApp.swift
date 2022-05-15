//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Darot on 09/05/2022.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView()
                .onAppear {
                    print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
                }
        }
    }
}
