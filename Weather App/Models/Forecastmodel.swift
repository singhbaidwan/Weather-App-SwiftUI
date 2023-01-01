//
//  ForeCast.swift
//  Weather App
//
//  Created by Dalveer singh on 01/01/23.
//

import Foundation
enum ForecastPeriod{
    case hourly
    case daily
}

enum Weather:String{
    case clear = "Clear"
    case cloudy = "Cloudy"
    case rainy = "Mid Rain"
    case stormy = "Showers"
    case sunny = "Sunny"
    case tornado = "Tornado"
    case windy = "Fast wind"
}

struct Forecast:Identifiable{
    var id = UUID().uuidString
    var date:Date
    var weather:Weather
    var probabilty:Int
    var temperature:Int
    var high:Int
    var low:Int
    var location:String
    
    var icon:String
    {
        switch(weather){
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
extension Forecast{
    static let hour:TimeInterval = 60*60
    static let day:TimeInterval = 60*60*24
    static let hourly:[Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: hour * -1), weather: .rainy, probabilty: 30, temperature: 19, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .now, weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 1), weather: .windy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 2), weather: .rainy, probabilty: 0, temperature: 18, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 3), weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .init(timeIntervalSinceNow: hour * 4), weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Delhi")
    ]
    
    static let daily:[Forecast] = [
        Forecast(date: .init(timeIntervalSinceNow: 0), weather: .rainy, probabilty: 30, temperature: 19, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .init(timeIntervalSinceNow: day * 1), weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .init(timeIntervalSinceNow: day * 2), weather: .windy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .init(timeIntervalSinceNow: day * 3), weather: .rainy, probabilty: 0, temperature: 18, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .init(timeIntervalSinceNow: day * 4), weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .init(timeIntervalSinceNow: day * 5), weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Delhi")
    ]
    
    static let cities:[Forecast] = [
        Forecast(date: .now, weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Delhi"),
        Forecast(date: .now, weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Montreal Canada"),
        Forecast(date: .now, weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Tokyo Japan"),
        Forecast(date: .now, weather: .rainy, probabilty: 0, temperature: 19, high: 24, low: 18, location: "Toronto Canada")
    ]
    
}
