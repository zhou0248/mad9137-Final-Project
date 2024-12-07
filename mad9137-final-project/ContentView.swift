//
//  ContentView.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-11-19.
//

import SwiftUI

class GeoModelCity: ObservableObject {
    @Published var geoData: [CityGeo]?
    @Published var city: String = ""
    @Published var errorMessage: String = ""
    
    private var geoInfo = GeoService()
    
    func fetchGeo() async throws {
        do {
            let data = try await geoInfo.fetchCoord(city: city)
            switch data {
            case .success(let cityGeo):
                geoData = cityGeo
            case .failure(let error):
                print(error)
            }
        } catch {
            print(error)
        }
    }
}


struct ContentView: View {
    
    @StateObject private var geoInfo = GeoModelCity()
    
    var body: some View {
        VStack {
            TextField("Enter city name", text: $geoInfo.city)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Get Geo") {
                Task {
                    let geo = try await geoInfo.fetchGeo()
                    
                }
            }.padding()
            
            if let geoCoord = geoInfo.geoData {
                Text("City: \(geoCoord[0].name )")
                Text("Coordinates: \nLatitude:\(geoCoord[0].lat), Longitude:\(geoCoord[0].lon)")
            } else if !geoInfo.errorMessage.isEmpty {
                Text(geoInfo.errorMessage)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
