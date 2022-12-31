//
//  ForecastView.swift
//  Weather App
//
//  Created by Dalveer singh on 30/12/22.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        ScrollView{
            
        }
        
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, linewidth: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1)
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
