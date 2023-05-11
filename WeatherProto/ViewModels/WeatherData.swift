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
    @Published var dayWeather: [ForecastData]?
    @Published var hourWeather: [ForecastData]?
    
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
    func dailyForecast(location: CLLocation) async -> [DayWeather]? {
        let dayWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather(for: location, including: .daily)
            return forcast?.forecast
        }.value
        self.dayWeather = dayWeather!.map{ForecastData(dayWeather: $0)}
        return dayWeather
    }
    
    @discardableResult
    func hourlyForecast(location: CLLocation) async -> [HourWeather]? {
        let hourWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather( for: location, including: .hourly)
            return forcast?.forecast
        }.value
        
        self.hourWeather = hourWeather!.map{ForecastData(hourWeather: $0)}
        return hourWeather
    }
}
