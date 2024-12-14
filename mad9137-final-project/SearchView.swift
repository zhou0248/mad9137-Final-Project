//
//  SearchView.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    @EnvironmentObject var cityList: CityList
    @State var newCity: String = ""
    
    var body: some View {
        VStack{
            HStack{
                //verify city name before appending it to the list
                TextField("Search for a City", text: $newCity)
                    .keyboardType(.webSearch)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Search") {
                    Task {
                        cityList.cities.append(newCity)
                        let weatherInfo: () = try await viewModel.fetchWeather(city:newCity)
                    }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    SearchView()
}
