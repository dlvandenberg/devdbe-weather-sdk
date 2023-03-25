//
//  File.swift
//
//
//  Created by Dennis van den Berg on 25/03/2023.
//

import Foundation

struct RForecastDay: Decodable {
    var city_name: String?
    var country_code: String?
    var lat: String?
    var lon: String?
    var data: [RForecast]
}

struct RForecast: Decodable {
    var datetime: String?
    var temp: Float?
    var weather: RWeather?
}

struct RWeather: Decodable {
    var description: String?
    var code: Int?
}
