//
//  CityDetail.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import SwiftUI

struct CityDetailView: View {
    
    var weather: WeatherInfo
    var isMetric : Bool
    
    var body: some View {
        VStack {
            Text("Current Weather in \(weather.location.name)")
            HStack{
                Text("\(weather.location.region)")
                Text("\(weather.location.country)")
            }
            Spacer()
            HStack{
                let weatherIcon = "https:" + weather.current.condition.icon
                AsyncImage(url: URL(string: weatherIcon))
                VStack{
                    Text("Weather: \(weather.current.condition.text)")
                    Text(isMetric ? "Temperature: \(weather.current.temp_c)": "Temperature: \(weather.current.temp_f)")
                    Text(isMetric ? "Feels Like: \(weather.current.feelslike_c)" : "Feels Like: \(weather.current.feelslike_c)")
                    Text("Humidity: \(weather.current.humidity)")
                    Text("Humidity: \(weather.current.uv)")
                    Text(isMetric ? "Wind Speead: \(weather.current.wind_kph)" : "Wind Speead: \(weather.current.wind_mph)")
                }
            }
            Spacer()
            VStack{
                Text("Forecast for next: ????")
                Text("")
            }
            
//            TextField("Enter city name", text: $viewModel.city
//            )
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            Button("Check Weather") {
//                Task {
//                    let weatherInfo: () = try await viewModel.fetchWeather(city:"Ottawa")
//                }
//            }.padding()
//            
//            if let weather = viewModel.weather {
//               Text("Fetched Weather for \(viewModel.city)")
//                Text("Weather: \(weather.current.condition.text)")
//                Text("Forcast: \(weather.forecast.forecastday[0].hour[0].feelslike_c)")
//                let weatherIcon = "https:" + weather.current.condition.icon
//                AsyncImage(url: URL(string: weatherIcon))
//            } else if !viewModel.errorMessage.isEmpty {
//                Text(viewModel.errorMessage)
//           }
            
            
            
        }
        .padding()
    }
}

#Preview {
//    CityDetailView()
}
