//
//  WeatherView.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color.background.ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(ForecastSpecific.cities) { forecast in
                            WeatherCard(forecast: forecast)
                        }
                    }
                }
            }
            //.navigationBarHidden(true)
        }
        .searchable(text: $searchText)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
