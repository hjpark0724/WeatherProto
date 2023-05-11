//
//  ContentView.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/10.
//

import SwiftUI
import BottomSheet
import CoreLocation
import WeatherKit
enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83
    case middle = 0.385
}
struct ContentView: View {
    @State private var bottomSheetPosition: BottomSheetPosition = .middle
    @State private var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State private var hasDragged = false
    @State private var currentLocation: String = ""
    @EnvironmentObject private var weatherData: WeatherData
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                let imageOffset = screenHeight + 36
                ZStack {
                    Color.background.ignoresSafeArea()
                    Image("Background").resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    VStack {
                        Text(currentLocation)
                            .font(.largeTitle)
                        VStack {
                            Text(attributedString)
                            //Text("H:24°   L:18°")
                            //    .font(.title3.weight(.semibold))
                             //   .opacity(1 - bottomSheetTranslationProrated)
                        }
                        
                        Spacer()
                    }
                    .foregroundColor(.white)
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslationProrated * 46)
                    
                    BottomSheetView(position: $bottomSheetPosition) {
                    } content: {
                        ForcastView(bottomSheetTranslationProrated: bottomSheetTranslationProrated)
            
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        withAnimation(.easeOut) {
                            if bottomSheetPosition == BottomSheetPosition.top {
                                hasDragged = true
                            } else {
                                hasDragged = false
                            }
                        }
                    }
                    TabBar(action: {
                        bottomSheetPosition = .top
                    })
                        .offset(y: bottomSheetTranslationProrated * 115)
                }
            }
        }
        .task {
            //테스트용 서울 좌표 (용산구) 41.40338, 2.17403
            let location = CLLocation(latitude: 37.541, longitude: 126.986)
            let geocoder = CLGeocoder()
            let cur = try! await geocoder.reverseGeocodeLocation(location)
            currentLocation = cur.last!.administrativeArea ?? ""
            await weatherData.weather(location: location)
            await weatherData.dailyForecast(location: location)
            await weatherData.hourlyForecast(location: location)
            let conditions = WeatherCondition.allCases.map{ $0.description }
            print(conditions)
        }
        .navigationBarHidden(true)
    }
    
    private var attributedString: AttributedString {
        guard let current = weatherData.currentWeather else {
            return ""
        }
        let temperature = "\(Int(current.temperature.value))°"
        let condition = current.condition.description
        
        var string = AttributedString(temperature + (hasDragged ? " | " : "\n ") + condition)
        
        if let temp = string.range(of: temperature) {
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated * (96 - 20))), weight: hasDragged ? .semibold : .thin)
           // string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
           /// string[pipe].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
        }
        
        if let weather = string.range(of: condition) {
            string[weather].font = .title3.weight(.semibold)
            //string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(WeatherData())
            .preferredColorScheme(.dark)
    }
}
