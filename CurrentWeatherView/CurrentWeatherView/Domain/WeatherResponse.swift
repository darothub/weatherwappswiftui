//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Darot on 30/04/2022.
//

import Foundation


public struct WeatherResponse : Codable, Equatable {
    public static func == (lhs: WeatherResponse, rhs: WeatherResponse) -> Bool {
        return lhs.location.name == rhs.location.name
    }
    
    let location: Locations
    let current: Currents
    let forecast: Forecasts
    
    enum CodingKeys: String, CodingKey {
        case location = "location"
        case current = "current"
        case forecast = "forecast"
    }
}

extension WeatherResponse {
    init(weather:WeatherRealm){
        self.location = Locations(location: weather.location!)
        self.current = Currents(current: weather.current!)
        self.forecast = Forecasts(forecast: weather.forecast!)
    }
}


// MARK: - Current
struct Currents: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let condition: Conditions
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case condition
    }
}

extension Currents {
    
    init(current:CurrentRealm){
        self.lastUpdatedEpoch = Int(current.lastUpdatedEpoch)
        self.lastUpdated = current.lastUpdated
        self.tempC = current.tempC
        self.condition = Conditions(condition: current.condition!)
    }
}
struct Conditions : Codable{
    let text: String
    let icon: String
    let code: Int
}

extension Conditions {
    
    init(condition: ConditionRealm){
        self.text = condition.text
        self.icon = condition.icon
        self.code = Int(condition.code)
    }
}

struct Forecasts : Codable{
    let forecastday: [Forecastdays]
}

extension Forecasts {
    
    init(forecast: ForecastRealm){
        self.forecastday = forecast.forecastday.compactMap {
            let forecastdaydb = $0
            return Forecastdays(forecastdaydb: forecastdaydb )
        }
    }
}

struct Forecastdays : Codable{
    let date: String
    let dateEpoch: Int
    let day: Days
    let astro: Astros
    let hour: [Hours]
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

extension Forecastdays {
    
    init(forecastdaydb:ForecastdayRealm){
        self.date = forecastdaydb.date
        self.dateEpoch = Int(forecastdaydb.dateEpoch)
        self.day = Days(daydb: (forecastdaydb.day)!)
        self.astro = Astros(astrodb: forecastdaydb.astro!)
        self.hour = forecastdaydb.hour.compactMap({Hours(hourdb: $0)})
    }
}
struct Astros : Codable{
    let sunrise: String
    let sunset: String
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset
    }
}
extension Astros {
    
    init(astrodb:AstroRealm){
        self.sunrise = astrodb.sunrise
        self.sunset = astrodb.sunset
    }
}
struct Days : Codable{
    let avgtempC: Double
    let condition: Conditions
    
    enum CodingKeys: String, CodingKey {
        case avgtempC = "avgtemp_c"
        case condition
    }
}
extension Days {
    
    init(daydb:DayRealm){
        self.avgtempC = daydb.avgtempC
        self.condition = Conditions(condition: daydb.condition!)
    }
}
struct Hours : Codable{
        let timeEpoch: Int
        let tempC: Double
        let condition: Conditions
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

extension Hours {
    
    init(hourdb:HourRealm){
        self.timeEpoch = Int(hourdb.timeEpoch)
        self.tempC = hourdb.tempC
        self.condition = Conditions(condition:hourdb.condition!)
        self.windMph = hourdb.windMph
        self.pressureIn = hourdb.pressureIn
        self.humidity = Int(hourdb.humidity)
    }
}

struct Locations : Codable{
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

extension Locations {
    
    init(location:LocationRealm){
        self.name = location.name
        self.region = location.region
        self.country = location.country
        self.lat = location.lat
        self.lon = location.lon
        self.localtimeEpoch = Int(location.localtimeEpoch)
        self.localtime = location.localtime
    }

}
