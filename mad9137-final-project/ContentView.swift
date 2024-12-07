//
//  ContentView.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-11-19.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter city name", text: $viewModel.city)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Check Current Weather") {
                Task {
                    let current: () = try await viewModel.fetchCurrent()
                    print(current)
                }
            }.padding()
            
            if let currentWeather = viewModel.currentData {
                Text("Fetched Weather for \(viewModel.city)")
            } else if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
