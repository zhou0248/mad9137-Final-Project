//
//  weatherViewModel.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-07.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherInfo?
    @Published var errorMessage: String = ""
    
    private var weatherInfo = WeatherService()
    
    func fetchWeather(city:String) async throws {
        do {
            let weatherData = try await weatherInfo.fetchWeather(city: city)
            await assignWeather(weatherData: weatherData)
        } catch {
            print(error)
        }
    }
    @MainActor
    func assignWeather (weatherData: WeatherInfo) {
        weather = weatherData
    }
}

