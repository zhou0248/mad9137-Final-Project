//
//  weatherViewModel.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-07.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    
    @Published var errorMessage: String = ""
    @Published var weatherList: [WeatherInfo] = []
    private var weatherInfo = WeatherService()
    
    func fetchWeather(city:String) async throws {
        do {
            let weatherInfo = try await weatherInfo.fetchWeather(city: city)
            await assignWeather(weatherInfo: weatherInfo)
        } catch {
            print(error)
        }
    }
    
    @MainActor
    func assignWeather (weatherInfo: WeatherInfo) {
        weatherList.append(weatherInfo)
    }
}

