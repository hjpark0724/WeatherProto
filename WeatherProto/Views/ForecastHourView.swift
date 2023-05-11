//
//  ForecastHourView.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import SwiftUI
import CoreLocation
import WeatherKit

struct ForecastHourView: View {
    @EnvironmentObject var weatherData: WeatherData
    var body: some View {
        VStack {
            let conditions = WeatherCondition.allCases.map{ $0.description }
            ScrollView {
                ForEach(0..<conditions.count, id: \.self) { i in
                    Text("\(conditions[i])")
                }
            }
        }
    }
    
}

struct ForecastHourView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastHourView().environmentObject(WeatherData())
    }
}
