//
//  SunTimingView.swift
//  Weather App
//
//  Created by Dalveer singh on 03/01/23.
//

import SwiftUI

struct SunTimingView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.tabBarBackground)
            VStack(alignment: .center){
                HStack{
                    Image(systemName: "sunrise.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15,height: 15)
                    Text("SUNRISE")
                        .font(.system(size: 14))
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding()
                Text("5:28 AM")
                    .font(.system(size: 20))
                    .bold()
                CurveView()
                    .stroke(Color.weatherWidgetBackground ,lineWidth: 4)
                    .padding(.bottom)
                    .padding([.leading,.trailing],5)
            }
            //height : 85
            Rectangle()
                .fill(.clear)
                .blendMode(.color)
                .border(width: 2, edges: [.top], color: .white)
                .frame(height: 50)
                .frame(maxHeight: .infinity,alignment: .bottom)
            
            Text("Sunset : 7:25 AM")
                .font(.system(size: 15))
                .bold()
                .padding(.bottom,7)
                .frame(maxHeight: .infinity,alignment: .bottom)
                
            
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.weatherWidgetBackground,lineWidth: 2)
        }
        .frame(width: 170,height: 180)
        
        
    }
}

struct CurveView:Shape{
    
    func path(in rect: CGRect) -> Path {
    
        Path{ path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.minY-50))
        }
    }
}

struct SunTimingView_Previews: PreviewProvider {
    static var previews: some View {
        SunTimingView()
    }
}
