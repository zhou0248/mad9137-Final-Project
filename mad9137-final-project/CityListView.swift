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
    @EnvironmentObject var cityList: CityList
    @EnvironmentObject var userSettings: UserSettings
    
    var isMetric = UserSettings.init().unit == Unit.metric
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (viewModel.weatherList, id:\.self) {
                    weather in NavigationLink (destination: CityDetailView(weather: weather, bool: isMetric))
                        {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                        } else {
                            VStack{
                                Text("Weather for \(weather.location)")
                                HStack{
                                    VStack{
                                        Text("Weather: \(weather.current.condition.text)")
                                        Text(isMetric ? "Forcast: \(weather.forecast.forecastday[0].hour[0].feelslike_c)" :
                                            "Forcast: \(weather.forecast.forecastday[0].hour[0].feelslike_f)")
                                            }
                                    let weatherIcon = "https:" + weather.current.condition.icon
                                                                    AsyncImage(url: URL(string: weatherIcon))
                                }
                            }
                        }
                    }
                }
//                ForEach(cityList.cities, id: \.self) { city in
//                    NavigationLink (destination: CityDetailView()) {
//                        VStack{
//                            !viewModel.errorMessage.isEmpty ?
//                                    Text(viewModel.errorMessage)
//                            :
//                            Text("Weather for \(city)")
//                            let weather = viewModel.weatherList {
//                                HStack{
//                                    VStack{
//                                        Text("Weather: \(weather.current.condition.text)")
//                                        Text("Forcast: \(weather.forecast.forecastday[0].hour[0].feelslike_c)")
//                                    }
//                                    let weatherIcon = "https:" + weather.current.condition.icon
//                                    AsyncImage(url: URL(string: weatherIcon))
//                                    }
//                            }
//                        }
//                    }
                }
                .task {
                        await cityList.refreshList()
                        cityList.startTimer()
                }
            }.navigationTitle("Weather")
        }
    }

#Preview {
    CityListView()
}
