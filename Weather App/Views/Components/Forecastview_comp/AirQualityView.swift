//
//  AirQualityView.swift
//  Weather App
//
//  Created by Dalveer singh on 04/01/23.
//

import SwiftUI

struct AirQualityView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
            .fill(Color.tabBarBackground)
            
            
            HStack{
                Image(systemName: "aqi.low")
                    .frame(width: 22,height: 22)
                Text("AIR QUALITY")
                    .font(.system(size: 22))
            }
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            
            VStack(alignment: .leading){
                Text("3-Low Health Risk")
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                SliderView2(value: .constant(30))
                    .frame(height: 10)
                    .offset(y:10)
            }
            .padding()
            
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.weatherWidgetBackground,lineWidth: 2)
        }
        .frame(width: 380,height: 180)
    }
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityView()
    }
}
