//
//  ForecastCard.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import SwiftUI

struct ForecastCard: View {
    var forecast: ForecastData
    var forecastPeriod: ForecastPeriod
    
    var isActive: Bool {
        if forecastPeriod == ForecastPeriod.hourly {
            return Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .hour)
        } else {
            return Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .day)
        }
    }
    
    var body: some View {
        ZStack {
            //Background 이미지
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.2))
                .frame(width: 80, height: 146)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.white.opacity(isActive ? 0.5 : 0.2),
                                lineWidth: 0.5)
                        .blendMode(.overlay)
                )
            
            VStack(spacing: 16) {
                Text(forecast.date,
                     format: forecastPeriod == .hourly ? .dateTime.hour() : .dateTime.weekday())
                .font(.subheadline)
                .fontWeight(.semibold)
                VStack(spacing: 0) {
                    //Image("\(forecast.icon) small")
                    Image(systemName: forecast.symbolName)
                    Text(forecast.precipitationChance, format: .percent)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }.frame(height: 46)
                if forecastPeriod == .hourly {
                    Text("\(forecast.temperature)°")
                        .font(.title3)
                } else {
                    Text("\(forecast.highTemperature)°/\(forecast.lowTemperature)°")
                }
                
            }
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .frame(width: 80, height: 146)
            
        }
    }
}

struct ForecastCard_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCard(forecast: ForecastData.hourly[0], forecastPeriod: .hourly)
            //.preferredColorScheme(.dark)
    }
}
