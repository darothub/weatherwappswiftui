//
//  WeatherRealm.swift
//  WeatherApp
//
//  Created by Darot on 12/05/2022.
//


import RealmSwift

class WeatherRealm : Object, Codable, ObjectKeyIdentifiable, DataObject {
    @Persisted var location: LocationRealm?
    @Persisted var current: CurrentRealm?
    @Persisted var forecast: ForecastRealm?
    
    enum CodingKeys: String, CodingKey {
        case location = "location"
        case current = "current"
        case forecast = "forecast"
    }
}


class LocationRealm : Object, Codable {
    @Persisted var name: String = ""
    @Persisted var region: String = ""
    @Persisted var country: String = ""
    @Persisted var lat: Double = 0
    @Persisted var lon: Double = 0
    @Persisted var localtimeEpoch: Int = 0
    @Persisted var localtime: String = ""
    
    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}


class CurrentRealm:Object, Codable {
    @Persisted var lastUpdatedEpoch: Int = 0
    @Persisted var lastUpdated: String = ""
    @Persisted var tempC: Double = 0
    @Persisted var condition: ConditionRealm?
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case condition
    }
}

class ForecastRealm : Object, Codable {
    @Persisted var forecastday = RealmSwift.List<ForecastdayRealm>()
}


class ForecastdayRealm : Object, Codable, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var date: String = ""
    @Persisted var dateEpoch: Int = 0
    @Persisted var day: DayRealm?
    @Persisted var astro: AstroRealm?
    @Persisted var hour = RealmSwift.List<HourRealm>()
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, astro, hour
    }
}

class AstroRealm: Object, Codable {
    @Persisted var sunrise: String = ""
    @Persisted var sunset: String = ""
    enum CodingKeys: String, CodingKey {
        case sunrise, sunset
    }
}

class DayRealm : Object, Codable {
    @Persisted var avgtempC: Double = 0
    @Persisted var condition: ConditionRealm?
    
    enum CodingKeys: String, CodingKey {
        case avgtempC = "avgtemp_c"
        case condition
    }
}

class ConditionRealm : Object, Codable {
    @Persisted var text: String
    @Persisted var icon: String
    @Persisted var code: Int
}

class HourRealm : Object, Codable, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var timeEpoch: Int = 0
    @Persisted var tempC: Double = 0
    @Persisted var condition: ConditionRealm?
    @Persisted var windMph: Double = 0
    @Persisted var pressureIn: Double = 0
    @Persisted var humidity: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case tempC = "temp_c"
        case condition
        case windMph = "wind_mph"
        case pressureIn = "pressure_in"
        case humidity
    }
}


protocol DataObject {
    var location: LocationRealm? {get set}
    var current: CurrentRealm? {get set}
    var forecast: ForecastRealm? {get set}
}
