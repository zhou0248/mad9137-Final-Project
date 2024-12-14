//
//  CityDetail.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import SwiftUI

struct CityDetailView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel

    var body: some View {
        VStack {
//            TextField("Enter city name", text: $viewModel.city
//            )
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
            Button("Check Weather") {
                Task {
                    let weatherInfo: () = try await viewModel.fetchWeather(city:"Ottawa")
                }
            }.padding()
            
            if let weather = viewModel.weather {
               Text("Fetched Weather for \(viewModel.city)")
                Text("Weather: \(weather.current.condition.text)")
                Text("Forcast: \(weather.forecast.forecastday[0].hour[0].feelslike_c)")
                let weatherIcon = "https:" + weather.current.condition.icon
                AsyncImage(url: URL(string: weatherIcon))
            } else if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
            }
        }
        .padding()
    }
}

#Preview {
    CityDetailView()
}
