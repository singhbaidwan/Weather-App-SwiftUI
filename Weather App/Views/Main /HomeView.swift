//
//  HomeView.swift
//  Weather App
//
//  Created by Dalveer singh on 29/12/22.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition:CGFloat,CaseIterable{
    case top = 0.83
    case middle = 0.385 // 1075.75 (Size of sheet from figma design) / 2796(size of screen)   (325/844)
}

struct HomeView: View {
    
    @State var bottomSheetPosition:BottomSheetPosition = .middle
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color.background
                    .ignoresSafeArea()
                
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                Image("House")
                    .frame(maxHeight: .infinity,alignment: .top)
                    .padding(.top,257)
                
                VStack(spacing:-10){
                    Text("Sirhind")
                        .font(.largeTitle)
                    
                    VStack{
                        
                        //                    Text("19°")
                        //                        .font(.system(size: 96,weight: .thin))
                        //                        .foregroundColor(.primary)
                        //                    +
                        //                    Text("\n")
                        //                    +
                        //                    Text("Mostly Clear")
                        //                        .font(.title3.weight(.semibold))
                        //                        .foregroundColor(.secondary)
                        
                        Text(attributedString)
                        
                        Text("H:24  L:18")
                            .font(.title3.weight(.semibold))
                        
                    }
                    Spacer()
                }
                .padding(.top,51)
                
                //MARK: Bottom Sheet
                BottomSheetView(position: $bottomSheetPosition) {
//                    Text(bottomSheetPosition.rawValue.formatted())
                } content: {
                    ForecastView()
                }

                
                //MARK: Tab Bar
                TabBar()
                {
                    self.bottomSheetPosition = .top
                }
        
            }
            .navigationBarHidden(true)
        }
    }
    private var attributedString:AttributedString{
        var string = AttributedString("19°"+"\n "+"Mostly Clear")
        
        if let temp = string.range(of: "19°"){
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | "){
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        if let weather = string.range(of: "Mostly Clear"){
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
