//
//  UVIndexView.swift
//  Weather App
//
//  Created by Dalveer singh on 03/01/23.
//

import SwiftUI

struct UVIndexView: View {
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.tabBarBackground)
            VStack(alignment: .leading) {
                
                HStack{
                    Image(systemName: "sun.max.fill")
                        .resizable()
                        .frame(width: 20,height: 20)
                    Text("UV Index")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Spacer()
                }
                Group{
                Text("\(4)")
                Text("Moderate")}
                    .font(.system(size: 30))
                    .fontWeight(.semibold)

                
                SliderView2(value: .constant(10))
                    .frame(height: 10)
            }
            .padding()
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.weatherWidgetBackground,lineWidth: 2)
        }
        .frame(width: 170,height: 180)
    }
}

struct UVIndexView_Previews: PreviewProvider {
    static var previews: some View {
        UVIndexView()
    }
}
