//
//  WeatherApi.swift
//
//
//  Created by Dennis van den Berg on 25/03/2023.
//

import Foundation

public protocol WeatherApi {
    func dailyForecast(city: String, countryCode: String, days: Int) async -> RForecastDay?
}

public class WeatherApiImpl: WeatherApi {
    public init(apiKey: String) {
        self.apiKey = apiKey
        print("SDK: Initialized WeatherAPI.")
    }
    
    private var apiKey: String
    
    let baseUrl = "https://api.weatherbit.io/v2.0/"
    
    public func dailyForecast(city: String, countryCode: String, days: Int) async -> RForecastDay? {
        let endpointUrl = "forecast/daily"
        let path = baseUrl + endpointUrl
        
        guard var urlComponents = URLComponents(string: path) else {
            fatalError("Could not create API URL")
        }
        urlComponents.queryItems = [
            URLQueryItem(name: "key", value: self.apiKey),
            URLQueryItem(name: "city", value: city),
            URLQueryItem(name: "country", value: countryCode),
            URLQueryItem(name: "days", value: String(days))
        ]
        
        guard let url = urlComponents.url else {
            fatalError("Could not construct URL")
        }
        
        do {
            print("SDK: Trying to fetch data from url \(url)")
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("SDK: Status !== 200 ")
                return nil
            }
            
            do {
                let decodedForecast = try JSONDecoder().decode(RForecastDay.self, from: data)
                print("SDK: Received \(decodedForecast.data.count) forecasts for \(decodedForecast.city_name)")
                return decodedForecast
            } catch {
                print("SDK: Could not decode: \(error)")
                return nil
            }
        } catch {
            print("SDK: Error while fetching data \(error)")
            return nil
        }
    }
}
