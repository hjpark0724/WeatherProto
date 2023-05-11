//
//  WeatherProvider.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import WeatherKit
import CoreLocation

@MainActor
class WeatherData: ObservableObject {
    let service = WeatherService.shared
    @Published var currentWeather: CurrentWeather?
    @Published var dayWeather: Forecast<DayWeather>?
    @Published var hourWeather: Forecast<HourWeather>?
    
    @discardableResult
    func weather(location: CLLocation) async -> CurrentWeather? {
        let currentWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather(for: location, including: .current)
            return forcast
        }.value
        self.currentWeather = currentWeather
        return currentWeather
    }
    
    @discardableResult
    func dailyForecast(location: CLLocation) async -> Forecast<DayWeather>? {
        let dayWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather(for: location, including: .daily)
            return forcast
        }.value
        self.dayWeather = dayWeather
        return dayWeather
    }
    
    @discardableResult
    func hourlyForecast(location: CLLocation) async -> Forecast<HourWeather>? {
        let hourWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather( for: location, including: .hourly)
            return forcast
        }.value
        self.hourWeather = hourWeather
        return hourWeather
    }
}
