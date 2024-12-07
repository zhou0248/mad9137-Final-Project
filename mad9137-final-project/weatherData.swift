//
//  weatherData.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-05.
//

import Foundation

struct CityGeo: Codable {
    let name: String
    let lat: Double
    let lon: Double
}

struct WeatherInfo : Codable {
    let city: String
    let temperature: Double
    let weather: String
    let icon: String
    //let time
}

struct GeoService {
    let apiKey = "78e3b8ef24c1779db5533624c3d3a9e5"
    let geoUrl = "https://api.openweathermap.org/geo/1.0/direct"
    
    func fetchCoord (city: String) async throws -> Result<[CityGeo],Error> {
        
        let geoSearch = "\(geoUrl)?q=\(city)&appid=\(apiKey)"
        
        guard let url = URL(string: geoSearch)
        else { return .failure(URLError(.badURL)) }
        
        let (data, _ ) = try await URLSession.shared.data(from: url)
        print("\(data)")
        do {
            let cityGeo = try JSONDecoder().decode([CityGeo].self,from: data)
            return .success(cityGeo)
        } catch {
            print(error)
            return.failure(error)
        }
    }
    
}

