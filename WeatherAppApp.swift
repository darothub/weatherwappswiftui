//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Darot on 26/04/2022.
//

import SwiftUI

@main
struct WeatherAppApp: App {


    var body: some Scene {
        WindowGroup {
            LandingView()
        }
    }
    
    fileprivate func enableTransparentNavigationBar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
    }
}
