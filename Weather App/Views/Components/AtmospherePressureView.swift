//
//  gear.swift
//  Weather App
//
//  Created by Dalveer singh on 04/01/23.
//

import SwiftUI

struct AtmospherePressureView: View {
    let gradient = LinearGradient(colors: [.white,.clear], startPoint: .leading, endPoint: .trailing)
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.tabBarBackground)
            
            HStack{
                Image(systemName: "speedometer")
                Text("Pressure")
            }
            .fontWeight(.bold)
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            .foregroundColor(.white)
            .padding([.top,.leading])
            
            Text("1024\n hpa")
                .fontWeight(.bold)
                .font(.system(size: 22))
                .foregroundColor(.white)
                .offset(y:15)
            
            gearView
                .offset(y:18)
            
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.weatherWidgetBackground,lineWidth: 2)
        }
        .frame(width: 180,height: 180)
    }
}

struct gear_Previews: PreviewProvider {
    static var previews: some View {
        AtmospherePressureView()
    }
}

extension AtmospherePressureView{
    var gearView:some View{
        ZStack(alignment: .center){
            
            Rectangle()
                .frame(width:3,height: 12)
                .font(.title3)
                .offset(x: 0, y: -65)
                .foregroundColor(.white)
                .rotationEffect(.degrees(180))

            
            ForEach(0 ..< 60) {
                Rectangle()
                    .frame(width: 3, height: 9)
                    .foregroundColor(.white)
                    .offset(y: -60)
                    .rotationEffect(.degrees(Double($0) * 45))
                    .opacity(0.2)
            }
            
            ForEach(0 ..< 120) {
                Rectangle()
                    .frame(width: 3, height: 9)
                    .foregroundColor(.white)
                    .offset(y: -60)
                    .rotationEffect(.degrees(Double($0) * 9))
                    .opacity(0.2)
            }
            
            Circle()
                .trim(from:0 ,to:0.4)
                .stroke(gradient,style: StrokeStyle(lineWidth: 10,lineCap: .square))
                .overlay{
                    Circle()
                        .trim(from: 0,to: 0.4)
                        .stroke(gradient, style: StrokeStyle(lineWidth: 10, lineCap: .butt))
                }
                .rotationEffect(.init(degrees: 93))
                .frame(width: 120,height: 120)
        }
    }
}
