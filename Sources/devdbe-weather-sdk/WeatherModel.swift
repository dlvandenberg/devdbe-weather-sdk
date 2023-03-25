//
//  File.swift
//
//
//  Created by Dennis van den Berg on 25/03/2023.
//

import Foundation

public struct RForecastDay: Decodable {
    public init() {}
    var city_name: String?
    var country_code: String?
    var lat: String?
    var lon: String?
    var data: [RForecast]
}

public struct RForecast: Decodable {
    public init() {}
    var datetime: String?
    var temp: Float?
    var weather: RWeather?
}

public struct RWeather: Decodable {
    public init() {}
    var description: String?
    var code: Int?
}
