//
//  CityList.swift
//  mad9137-final-project
//
//  Created by A 1 on 2024-12-09.
//

import SwiftUI

struct CityListView: View {
    
    @EnvironmentObject var viewModel: WeatherViewModel
    
    var body: some View {
       Text("City List")
    }
}

#Preview {
    CityListView()
}
