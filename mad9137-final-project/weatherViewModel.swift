//
//  weatherViewModel.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-07.
//

import SwiftUI


class WeatherViewModel: ObservableObject {
    @Published var currentData: [CurrentWeather]?
    @Published var city: String = ""
    @Published var errorMessage: String = ""
    
    private var weatherInfo = WeatherService()
    
    func fetchCurrent() async throws {
        do {
            let data = try await weatherInfo.fetchCurrent(city: city)
            switch data {
            case .success(let current):
                currentData = current
            case .failure(let error):
                print(error)
            }
        } catch {
            print(error)
        }
    }
}

