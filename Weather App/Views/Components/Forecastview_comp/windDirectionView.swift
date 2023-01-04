//
//  windDirectionView.swift
//  Weather App
//
//  Created by Dalveer singh on 04/01/23.
//

import SwiftUI

struct windDirectionView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.tabBarBackground)
            HStack{
                Image(systemName: "wind")
                    .resizable()
                    .frame(width: 14,height: 14)
                Text("Wind")
                
            }
            .foregroundColor(.white)
            .padding([.top,.leading],5)
            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
            
            ZStack(alignment: .center){
                
                Text("N")
                    .font(.title3)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -73)
                
                Text("E")
                    .font(.title3)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -73)
                    .rotationEffect(.degrees(90))
                
                Text("S")
                    .font(.title3)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -73)
                    .rotationEffect(.degrees(180))
                
                Text("W")
                    .font(.title3)
                    .foregroundColor(.white)
                    .offset(x: 0, y: -73)
                    .rotationEffect(.degrees(270))
                Text("6.9")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                    .background{
                        ZStack{
                            Image(systemName: "arrow.right")
                                .resizable()
                                .fontWeight(.light)
                                .scaledToFit()
                                .foregroundColor(.white)
                                .mask({
                                    Rectangle()
                                        .frame(width: 80,height: 20)
                                })
                                .frame(width: 80,height: 80)
                            Circle()
                                .fill(.white)
                                .frame(width: 33,height: 33)
                        }
                    }
                ForEach(0 ..< 60) {
                    Rectangle()
                        .frame(width: 3, height: 12)
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
                
                
            }
            
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.weatherWidgetBackground,lineWidth: 2)
        }
        .frame(width: 180,height: 180)
    }
}

struct windDirectionView_Previews: PreviewProvider {
    static var previews: some View {
        windDirectionView()
    }
}
