//
//  ContentView.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-11-19.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        CityListView()
            .environmentObject(viewModel)
        TabView{
            CityListView()
                .tabItem{
                    Label("List", systemImage: "list.bullet")
                }
            SearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
            SettingsView()
                .tabItem{
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
