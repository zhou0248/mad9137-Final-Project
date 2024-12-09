//
//  weatherData.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-05.
//

import Foundation

struct WeatherInfo : Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}

struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let localtime: String
}

struct Current: Codable {
    let temp_c: Double
    let temp_f: Double
    let feelslike_c: Double
    let feelslike_f: Double
    let uv: Double
    let humidity: Double
    let wind_kph: Double
    let wind_mph: Double
    let condition: Condition
}

struct Condition: Codable {
    let text: String
    let icon: String
}

struct Forecast: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable {
    let hour: [WeatherHour]
}

struct WeatherHour: Codable {
    let time: String
    let temp_c: Double
    let temp_f: Double
    let feelslike_c: Double
    let feelslike_f: Double
    let uv: Double
    let humidity: Double
    let wind_kph: Double
    let wind_mph: Double
    let condition: Condition
}

struct WeatherService {
    let apiKey = "dafb55206f2d43b79bc205851242202"
    let baseURL = "https://api.weatherapi.com/v1/"
    
    func fetchWeather(city: String) async throws -> WeatherInfo {
        
        let weatherURL = "\(baseURL)forecast.json?key=\(apiKey)&q=\(city)&days=1&aqi=no"
        
        guard let url = URL(string: weatherURL)
        else { throw URLError(.badURL) }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        let weatherInfo = try JSONDecoder().decode(WeatherInfo.self,from: data)
        return weatherInfo
    }
    
}
    

