//
//  ForcastView.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import SwiftUI
import WeatherKit
import CoreLocation
struct ForcastView: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    //@EnvironmentObject var weatherData: WeatherData
    var hourlyForecast: [ForecastData] = []
    var dailyForecast: [ForecastData] = []
    @State private var selection = 0
    var body: some View {
        ScrollView{
            VStack {
                SegmentControl(selection: $selection)
                ScrollView(.horizontal, showsIndicators: false ) {
                    HStack (spacing: 12) {
                        //시간별 데이터
                        if selection == 0 {
                            ForEach(hourlyForecast) { forcast in
                                ForecastCard(forecast: forcast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        } else {
                            //일별 데이터
                            ForEach(dailyForecast) { forcast in
                                ForecastCard(forecast: forcast, forecastPeriod: .daily)
                            }
                            .transition(.offset(x: 430))
                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                VStack{
                    HStack (spacing: 16){
                        Compass()
                        RainFallCard()
                    }
                    //Image("Forecast Widgets")
                }.opacity(bottomSheetTranslationProrated)
                
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44, style: .continuous))
        .overlay {
            // MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
        
    }
}

struct ForcastView_Previews: PreviewProvider {
    static var previews: some View {
        ForcastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
