//
//  CityList.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import Foundation
import SwiftUI

class CityList : ObservableObject {
    
    @Published var cities = ["Ottawa","Edmonton","Calgary","Vancouver","Toronto", "Halifax","Bangkok","Chiangmai","Singagpore","Hong Kong"];
    @EnvironmentObject var viewModel: WeatherViewModel
    @EnvironmentObject var userSettings: UserSettings
    
    private var timer: Timer?
    //https:www.dhiwise.com/post/understanding-swift-timer-key-terms-you-need-to-know
    var refreshInterval = UserSettings.init().refreshInterval
    
    func startTimer(refreshInterval:TimeInterval) {
        timer = Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(refreshList), userInfo: self, repeats: true)
    }
    
    @objc func refreshList () async {
        for city in cities {
            do { try await viewModel.fetchWeather(city: city)}
            catch {
                print(error)
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
