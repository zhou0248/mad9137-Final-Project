//
//  SearchView.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    @State var newCity: String = ""
    
    var body: some View {
        VStack{
            HStack{
                TextField("Search for a City", text: $newCity)
                    .keyboardType(.webSearch)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Search") { Task {
                    
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
