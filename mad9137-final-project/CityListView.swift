//
//  CityList.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import SwiftUI

struct CityListView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    let cities = ["Ottawa","Edmonton","Calgary","Vancouver","Toronto"];
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(cities, id: \.self) { city in
                    NavigationLink(destination: CityDetailView()) {
                        Text("Weather for \(city)")
                    }
                    .task {
                        do {
                            let weather: () = try await viewModel.fetchWeather()
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
