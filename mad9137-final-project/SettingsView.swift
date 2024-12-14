//
//  SettingsView.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import SwiftUI
import Foundation

class UserSettings: ObservableObject {
    @Published var refreshInterval: TimeInterval
    
    //https:www.dhiwise.com/post/understanding-swift-timer-key-terms-you-need-to-know
    private var timer: Timer?

    func startTimer(TimeInterval: refreshInterval) async {
               timer = Timer.scheduledTimer(timeInterval: refreshInterval, target: self, selector: #selector(refreshList), userInfo: nil, repeats: true)
           }
    
    @objc func refreshList () {
                
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}


struct SettingsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SettingsView()
}
