//
//  Forecast.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import Foundation
import WeatherKit

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

struct ForecastData : Identifiable {
    let id = UUID()
    let date: Date
    let temperature: Int
    let highTemperature: Int
    let lowTemperature: Int
    let precipitationChance: Int
    let symbolName: String
    
    init(dayWeather: DayWeather) {
        self.date = dayWeather.date
        self.temperature = Int(dayWeather.highTemperature.value)
        self.highTemperature = Int(dayWeather.highTemperature.value)
        self.lowTemperature = Int(dayWeather.lowTemperature.value)
        self.precipitationChance = Int(dayWeather.precipitationChance * 100)
        self.symbolName = dayWeather.symbolName
    }
    
    init(hourWeather: HourWeather) {
        self.date = hourWeather.date
        self.temperature = Int(hourWeather.temperature.value)
        self.highTemperature = Int(hourWeather.temperature.value)
        self.lowTemperature = Int(hourWeather.temperature.value)
        self.precipitationChance = Int(hourWeather.precipitationChance * 100)
        self.symbolName = hourWeather.symbolName
    }
    init(date: Date, temperature: Int, highTemperature: Int, lowTemperature: Int, precipitationChance: Int, symbolName: String) {
        self.date = date
        self.temperature = temperature
        self.highTemperature = highTemperature
        self.lowTemperature = lowTemperature
        self.precipitationChance = precipitationChance
        self.symbolName = symbolName
    }
}

extension ForecastData {
    static let hour: TimeInterval = 60 * 60
    static let hourly = [
        ForecastData(date: Date(timeIntervalSinceNow: hour * 1), temperature: 19, highTemperature: 20, lowTemperature: 18, precipitationChance: 20, symbolName: "cloud")
    ]
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


//    switch dayWeather.condition {
//    case .blowingDust:
//        ()
//    case .clear:
//        ()
//    case .cloudy:
//        ()
//    case .foggy:
//        ()
//    case .haze:
//        ()
//    case .mostlyClear:
//        ()
//    case .mostlyCloudy:
//        ()
//    case .partlyCloudy:
//        ()
//    case .smoky:
//        ()
//    case .breezy:
//        ()
//    case .windy:
//        ()
//    case .drizzle:
//        ()
//    case .heavyRain:
//        ()
//    case .isolatedThunderstorms:
//        ()
//    case .rain:
//        ()
//    case .sunShowers:
//        ()
//    case .scatteredThunderstorms:
//        ()
//    case .strongStorms:
//        ()
//    case .thunderstorms:
//        ()
//    case .frigid:
//        ()
//    case .hail:
//        ()
//    case .hot:
//        ()
//    case .flurries:
//        ()
//    case .sleet:
//        ()
//    case .snow:
//        ()
//    case .sunFlurries:
//        ()
//    case .wintryMix:
//        ()
//    case .blizzard:
//        ()
//    case .blowingSnow:
//        ()
//    case .freezingDrizzle:
//        ()
//    case .freezingRain:
//        ()
//    case .heavySnow:
//        ()
//    case .hurricane:
//        ()
//    case .tropicalStorm:
//        ()
//    default:
//        ()
//    }
//}
