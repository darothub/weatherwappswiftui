//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Foundation


struct WeatherResponse : Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}
// MARK: - Current
struct Current: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let condition: Condition
    let windMph: Double
    let pressureIn: Double
    let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case condition
        case windMph = "wind_mph"
        case pressureIn = "pressure_in"
        case humidity
    }
}
struct Condition : Codable{
    let text: String
    let icon: String
    let code: Int
}

struct Forecast : Codable{
    let forecastday: [Forecastday]
}

struct Forecastday : Codable{
    let date: String
    let dateEpoch: Int
    let day: Day
    let astro: Astro
    let hour: [Hour]
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}
struct Astro : Codable{
    let sunrise: String
    let sunset: String
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset
    }
}
struct Day : Codable{
    let avgtempC: Double
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case avgtempC = "avgtemp_c"
        case condition
    }
}
struct Hour : Codable{
        let timeEpoch: Int
        let tempC: Double
        let condition: Condition
        let windMph: Double
        let pressureIn: Double
        let humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case tempC = "temp_c"
        case condition
        case windMph = "wind_mph"
        case pressureIn = "pressure_in"
        case humidity
    }
}

struct Location : Codable{
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let localtimeEpoch: Int
    let localtime: String
    
    enum CodingKeys: String, CodingKey {
            case name, region, country, lat, lon
            case localtimeEpoch = "localtime_epoch"
            case localtime
    }

}
