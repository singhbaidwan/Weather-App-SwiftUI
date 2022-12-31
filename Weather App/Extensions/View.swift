//
//  View.swift
//  Weather App
//
//  Created by Dalveer singh on 30/12/22.
//

import SwiftUI
extension View{
    func backgroundBlur(radius:CGFloat = 3,opaque:Bool = false) -> some View{
        self
            .background(Blur(radius: radius, opaque: opaque))
    }
    
    /// function for creating the inner shadow of the view
    func innerShadow<S:Shape,SS:ShapeStyle>(shape:S,color:SS,linewidth:CGFloat = 1,offsetX:CGFloat = 0,offsetY:CGFloat = 0,blur:CGFloat = 4,blendMode:BlendMode = .normal) ->some View
    {
        return self
            .overlay{
             shape
                    .stroke(color,lineWidth: linewidth)
                    .blendMode(blendMode)
                    .offset(x:offsetX,y:offsetY)
                    .blur(radius: blur)
                    .mask{
                        shape
                    }
            }
    }
}
