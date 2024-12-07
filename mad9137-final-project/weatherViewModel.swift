//
//  weatherViewModel.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-07.
//

import SwiftUI


class WeatherViewModel: ObservableObject {
    @Published var currentData: CurrentWeather?
    @Published var city: String = ""
    @Published var errorMessage: String = ""
    
    
    private var weatherInfo = WeatherService()
    
    func fetchCurrent() async throws {
        do {
            let current = try await weatherInfo.fetchCurrent(city: city)
            currentData = current
        } catch {
            print(error)
        }
    }
}

