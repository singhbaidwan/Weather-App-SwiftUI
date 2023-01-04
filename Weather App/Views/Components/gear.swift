//
//  gear.swift
//  Weather App
//
//  Created by Dalveer singh on 04/01/23.
//

import SwiftUI

struct gear: View {
    var body: some View {
        ZStack(alignment: .center){
            
            Text("N")
                .font(.title3)
                .foregroundColor(.red)
                .offset(x: 0, y: -80)
            
            Text("E")
                .font(.title3)
                .foregroundColor(.red)
                .offset(x: 0, y: -80)
                .rotationEffect(.degrees(90))
            
            Text("S")
                .font(.title3)
                .foregroundColor(.red)
                .offset(x: 0, y: -80)
                .rotationEffect(.degrees(180))
            
            Text("W")
                .font(.title3)
                .foregroundColor(.red)
                .offset(x: 0, y: -80)
                .rotationEffect(.degrees(270))
            Text("6.9")
                .font(.system(size: 12))
                .background{
                    ZStack{
                        Image(systemName: "arrow.right")
                            .resizable()
                            .fontWeight(.light)
                            .scaledToFit()
                            .mask({
                                Rectangle()
                                    .frame(width: 80,height: 20)
                            })
                            .frame(width: 80,height: 80)
                        Circle()
                            .fill(.red)
                            .frame(width: 30,height: 30)
                    }
                }
            ForEach(0 ..< 60) {
                Rectangle()
                    .frame(width: 3, height: 15)
                    .foregroundColor(.black)
                    .offset(y: -60)
                    .rotationEffect(.degrees(Double($0) * 45))
                    .opacity(0.2)
            }
            
            ForEach(0 ..< 120) {
                Rectangle()
                    .frame(width: 3, height: 9)
                    .foregroundColor(.black)
                    .offset(y: -60)
                    .rotationEffect(.degrees(Double($0) * 9))
                    .opacity(0.2)
            }
            
            
        }
    }
}

struct gear_Previews: PreviewProvider {
    static var previews: some View {
        gear()
    }
}
