//
//  ForecastView.swift
//  Weather App
//
//  Created by Dalveer singh on 30/12/22.
//

import SwiftUI

struct ForecastView: View {
    var bottomSheetTranslationProrated:CGFloat = 1
    @State private var selection:Int = 0
    
    var body: some View {
        ScrollView{
            VStack(spacing: 0) {
                //MARK: Segmented Control
                SegmentedControl(selection: $selection)
                
                //MARK: Forecast Cards
                ScrollView(.horizontal,showsIndicators: false) {
                    LazyHStack(spacing: 12) {
                        if selection == 0{
                            ForEach(Forecast.hourly){ forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        }
                        else{
                            ForEach(Forecast.daily){ forecast in
                                ForecastCard(forecast: forecast, forecastPeriod: .daily)
                            }
                            .transition(.offset(x: 430))
                        }
                    }
                    .padding(.vertical,20)
                }
                .padding(.horizontal,20)
//
//                Image("Forecast Widgets")
//                    .opacity(bottomSheetTranslationProrated)
                
                VStack(spacing: 20){
                    AirQualityView()
                    HStack(spacing:20){
                        UVIndexView()
                        SunTimingView()
                    }
                    HStack(spacing:20){
                        windDirectionView()
                        CommonCardView(imageName: "drop.fill", sideTitle: "rainfall".uppercased(), mainTitle: "18 mm", mainTitle2: "in last hour",description: "1.2 mm expected in next 24h")
                    }
                    HStack(spacing: 20) {
                        CommonCardView(imageName: "thermometer.medium", sideTitle: "FEELS LIKE", mainTitle: "19°", mainTitle2: "", description: "Similar to the actual temperature")
                        CommonCardView(imageName: "humidity.fill", sideTitle: "HUMIDITY", mainTitle: "90%", mainTitle2: "", description: "The dew point is 17 right now")
                    }
                    HStack(spacing: 20) {
                        CommonCardView(imageName: "eye.fill", sideTitle: "VISIBILITY", mainTitle: "8 km", mainTitle2: "", description: "Similar to the actual temperature")
                    }
                }
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, linewidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1-bottomSheetTranslationProrated)
        .overlay {
            //MARK:  Bottom sheet Seperator
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBackground)
                .frame(maxHeight: .infinity,alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
            
        }
        .overlay{
            //MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48,height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity,alignment: .top)
            
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
