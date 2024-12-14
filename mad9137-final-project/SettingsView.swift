//
//  SettingsView.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import SwiftUI
import Foundation

enum Unit {
    case metric;
    case imperial;
}

class UserSettings: ObservableObject {
    @Published var refreshInterval: TimeInterval = 18000 //3 hours
    @Published var unit: Unit = Unit.metric
    
}


struct SettingsView: View {
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SettingsView()
}
