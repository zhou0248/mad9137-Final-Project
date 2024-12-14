//
//  CityList.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import SwiftUI
import Foundation

struct CityListView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
//    @State var cities = ["Ottawa","Edmonton","Calgary","Vancouver","Toronto"];
    @EnvironmentObject var cityList: CityList
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cityList.cities, id: \.self) { city in
                    NavigationLink (destination: CityDetailView()) {
                        VStack{
                            Text("Weather for \(city)")
                            if let weather = viewModel.weather {
                                HStack{
                                    VStack{
                                        Text("Weather: \(weather.current.condition.text)")
                                        Text("Forcast: \(weather.forecast.forecastday[0].hour[0].feelslike_c)")
                                    }
                                    let weatherIcon = "https:" + weather.current.condition.icon
                                    AsyncImage(url: URL(string: weatherIcon))
                                    }
                            } else if !viewModel.errorMessage.isEmpty {
                                    Text(viewModel.errorMessage)
                            }
                        }
                  }
                    .task {
                        do {
                            print(city)
                            try await viewModel.fetchWeather(city:city)
                        } catch {
                            print(error)
                        }
                    }
                }
            }.navigationTitle("Weather")
        }
    }
}

#Preview {
    CityListView()
}
