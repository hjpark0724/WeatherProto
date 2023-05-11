//
//  WeatherCard.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import SwiftUI

struct WeatherCard: View {
    var forecast: ForecastSpecific
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Trapezoid()
                .fill( .linearGradient(
                    colors: [
                        Color("Weather Widget Background 1"),
                        Color("Weather Widget Background 2")],
                    startPoint: .leading,
                    endPoint: .trailing))
                .frame(width: 342, height: 174)
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(forecast.temperature)°")
                        .font(.system(size: 64))
                    
                    VStack(alignment: .leading, spacing: 2){
                        Text("H:\(forecast.high)° L:\(forecast.low)°")
                            .font(.footnote)
                        .foregroundColor(.secondary)
                        Text(forecast.location)
                    }
                    
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Image("\(forecast.icon) large")
                        .padding(.trailing, 4)
                    Text("\(forecast.weather.rawValue)")
                        .font(.footnote)
                        .padding(.trailing, 24)
    
                }
            }
            .foregroundColor(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)
        }
        .frame(width: 342, height: 184, alignment: .bottom)
    }
}

struct WeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCard(forecast: ForecastSpecific.cities[0])
            .preferredColorScheme(.dark)
    }
}
