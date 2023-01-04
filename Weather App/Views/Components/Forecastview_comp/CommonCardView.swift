//
//  commonCardView.swift
//  Weather App
//
//  Created by Dalveer singh on 04/01/23.
//

import SwiftUI

struct CommonCardView: View {
    let imageName:String
    let sideTitle:String
    let mainTitle:String
    let mainTitle2:String
    let description:String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
            .fill(Color.tabBarBackground)
            
            
            VStack(alignment:.leading){
                HStack{
                    Image(systemName: imageName)
                    Text(sideTitle)
                    Spacer()
                }
                .fontWeight(.bold)
                .padding(.bottom,1)
                
                Text(mainTitle)
                    .fontWeight(.bold)
                    .font(.system(size: 29))
                if mainTitle2 != ""{
                    Text(mainTitle2)
                        .fontWeight(.semibold)
                }
                Spacer()
                Text(description)
                    .fontWeight(.light)
                    .font(.system(size: 15))
            }
            .foregroundColor(.white)
            .padding()
            
            
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.weatherWidgetBackground,lineWidth: 2)
        }
        .frame(width: 180,height: 180)
    }
}

struct commonCardView_Previews: PreviewProvider {
    static var previews: some View {
        CommonCardView(imageName: "drop.fill", sideTitle: "rainfall".uppercased(), mainTitle: "18 mm", mainTitle2: "in last hour",description: "1.2 mm expected in next 24h")
    }
}
