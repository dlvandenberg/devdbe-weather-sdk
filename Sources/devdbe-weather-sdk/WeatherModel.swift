//
//  File.swift
//
//
//  Created by Dennis van den Berg on 25/03/2023.
//

import Foundation

public struct RForecastDay: Decodable {
    public init(city_name: String? = nil, country_code: String? = nil, lat: String? = nil, lon: String? = nil, data: [RForecast]) {
        self.city_name = city_name
        self.country_code = country_code
        self.lat = lat
        self.lon = lon
        self.data = data
    }
    
    var city_name: String?
    var country_code: String?
    var lat: String?
    var lon: String?
    var data: [RForecast]
}

public struct RForecast: Decodable {
    public init(datetime: String? = nil, temp: Float? = nil, weather: RWeather? = nil) {
        self.datetime = datetime
        self.temp = temp
        self.weather = weather
    }
    
    var datetime: String?
    var temp: Float?
    var weather: RWeather?
}

public struct RWeather: Decodable {
    public init(description: String? = nil, code: Int? = nil) {
        self.description = description
        self.code = code
    }
    
    var description: String?
    var code: Int?
}
