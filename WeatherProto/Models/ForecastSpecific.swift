//
//  Forecast.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import Foundation

enum ForecastPeriod {
    case hourly
    case daily
}

enum Weather: String {
    case clear = "Clear"
    case cloudy = "Cloudy"
    case rainy = "Mid Rain"
    case stormy = " Showers"
    case sunny = "Sunny"
    case tornado = "Tornado"
    case windy = "Fast Wind"
}

struct ForecastSpecific: Identifiable {
    var id = UUID()
    var date: Date
    var weather: Weather
    var probability: Int
    var temperature: Int
    var high: Int
    var low: Int
    var location: String
    var icon: String {
        switch weather {
        case .clear:
            return "Moon"
        case .cloudy:
            return "Cloud"
        case .rainy:
            return "Moon cloud mid rain"
        case .stormy:
            return "Sun cloud angled rain"
        case .sunny:
            return "Sun"
        case .tornado:
            return "Tornado"
        case .windy:
            return "Moon cloud fast wind"
        }
    }
}


extension ForecastSpecific {
    static let hour: TimeInterval = 60 * 60
    static let day: TimeInterval = 60 * 60 * 24
    
    static let hourly: [ForecastSpecific] = [
        ForecastSpecific(date: .init(timeIntervalSinceNow: hour * -1), weather: .rainy, probability: 30, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .now, weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .init(timeIntervalSinceNow: hour * 1), weather: .windy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .init(timeIntervalSinceNow: hour * 2), weather: .rainy, probability: 0, temperature: 18, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .init(timeIntervalSinceNow: hour * 3), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .init(timeIntervalSinceNow: hour * 4), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada")
    ]
    
    static let daily: [ForecastSpecific] = [
        ForecastSpecific(date: .init(timeIntervalSinceNow: 0), weather: .rainy, probability: 30, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .init(timeIntervalSinceNow: day * 1), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .init(timeIntervalSinceNow: day * 2), weather: .stormy, probability: 100, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .init(timeIntervalSinceNow: day * 3), weather: .stormy, probability: 50, temperature: 18, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .init(timeIntervalSinceNow: day * 4), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .init(timeIntervalSinceNow: day * 5), weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada")
    ]
    
    static let cities: [ForecastSpecific] = [
        ForecastSpecific(date: .now, weather: .rainy, probability: 0, temperature: 19, high: 24, low: 18, location: "Montreal, Canada"),
        ForecastSpecific(date: .now, weather: .windy, probability: 0, temperature: 20, high: 21, low: 19, location: "Toronto, Canada"),
        ForecastSpecific(date: .now, weather: .stormy, probability: 0, temperature: 13, high: 16, low: 8, location: "Tokyo, Japan"),
        ForecastSpecific(date: .now, weather: .tornado, probability: 0, temperature: 23, high: 26, low: 16, location: "Tennessee, United States")
    ]
}
