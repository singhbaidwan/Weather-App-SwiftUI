//
//  ForecastCard.swift
//  Weather App
//
//  Created by Dalveer singh on 01/01/23.
//

import SwiftUI

struct ForecastCard: View {
    var forecast:Forecast
    var forecastPeriod:ForecastPeriod
    var isActive:Bool {
        
        if forecastPeriod == ForecastPeriod.hourly{
            let isThisHour = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .hour)
            return isThisHour
        }
        else
        {
            let isToday = Calendar.current.isDate(.now, equalTo: forecast.date, toGranularity: .day)
            return isToday
        }
        
    }
    
    
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.forecastCardBackground.opacity(isActive ? 1 : 0.2))
                .frame(width: 60,height: 146)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
                .overlay{
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.white.opacity(isActive ? 0.5 : 0.2))
                        .blendMode(.overlay)
                }
                .innerShadow(shape: RoundedRectangle(cornerRadius: 30), color: .white.opacity(0.25), linewidth: 1, offsetX: 1, offsetY: 1, blur: 0, blendMode: .overlay)
            
            //MARK: Content
            VStack(spacing: 16){
                //MARK: Forecast Date
                Text(forecast.date,format: forecastPeriod == ForecastPeriod.hourly ? .dateTime.hour() : .dateTime.weekday())
                    .font(.subheadline.weight(.semibold))
                VStack(spacing: -4) {
                    //MARK: Forecast small icon
                    Image("\(forecast.icon) small")
                    
                    //MARK: Forecast Probability
                    Text(forecast.probabilty,format: .percent)
                        .font(.footnote.weight(.semibold))
                        .foregroundColor(Color.probabilityText)
                        .opacity(forecast.probabilty > 0 ? 1 : 0)
                    
                }
                .frame(height: 42)
                
                //MARK: Forecast Temperature
                Text("\(forecast.temperature)°")
                    .font(.title3)
                
                
            }
            .padding(.horizontal,8)
            .padding(.vertical,16)
            .frame(width: 60,height: 146)
        }
        
    }
    
}

struct ForecastCard_Previews: PreviewProvider {
    static var previews: some View {
        ForecastCard(forecast: Forecast.hourly[0], forecastPeriod: .hourly)
    }
}
