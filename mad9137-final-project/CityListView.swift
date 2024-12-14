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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.weatherList, id:\.self) {
                    weather in NavigationLink (destination: CityDetailView()){
                        
                    }
                }
//                ForEach(cityList.cities, id: \.self) { city in
//                    NavigationLink (destination: CityDetailView()) {
//                        VStack{
//                            !viewModel.errorMessage.isEmpty ??
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
                    do{
                        try await cityList.refreshList()
                        cityList.startTimer()
                        } catch {
                        print(error)
                        }
                }
            }.navigationTitle("Weather")
        }
    }
}

#Preview {
    CityListView()
}
