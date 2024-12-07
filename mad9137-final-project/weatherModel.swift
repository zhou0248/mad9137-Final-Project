//
//  weatherData.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-05.
//

import Foundation

struct CurrentWeather : Codable {
    let location: Location
    let current: Current
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

struct WeatherService {
    let apiKey = "dafb55206f2d43b79bc205851242202"
    let baseURL = "https://api.weatherapi.com/v1/"
    
    func fetchCurrent(city: String) async throws -> Result<[CurrentWeather],Error> {
        
        let currentURL = "\(baseURL)current.json?key=\(apiKey)&q=\(city)&aqi=no"
        
        guard let url = URL(string: currentURL)
        else { return .failure(URLError(.badURL)) }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        do {
            let current = try JSONDecoder().decode([CurrentWeather].self,from: data)
            return .success(current)
        } catch {
            print(error)
            return.failure(error)
        }
    }
    
}

