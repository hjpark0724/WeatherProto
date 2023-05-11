//
//  ForcastView.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import SwiftUI

struct ForcastView: View {
    var bottomSheetTranslationProrated: CGFloat = 1
    @State private var selection = 0
    var body: some View {
        ScrollView{
            VStack {
                SegmentControl(selection: $selection)
                ScrollView(.horizontal, showsIndicators: false ) {
                    HStack (spacing: 12) {
                        if selection == 0 {
                            ForEach(ForecastSpecific.hourly) { forcast in
                                ForecastCard(forecast: forcast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        } else {
                            ForEach(ForecastSpecific.daily) { forcast in
                                ForecastCard(forecast: forcast, forecastPeriod: .daily)
                            }
                            .transition(.offset(x: 430))
                        }
                    }
                    .padding(.vertical, 20)
                }
                .padding(.horizontal, 20)
                Image("Forecast Widgets")
                    .opacity(bottomSheetTranslationProrated)
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
