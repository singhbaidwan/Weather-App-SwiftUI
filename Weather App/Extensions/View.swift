//
//  View.swift
//  Weather App
//
//  Created by Dalveer singh on 30/12/22.
//

import SwiftUI

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return width
                case .leading, .trailing: return rect.height
                }
            }
            path.addRect(CGRect(x: x, y: y, width: w, height: h))
        }
        return path
    }
}
extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

extension View{
    func backgroundBlur(radius:CGFloat = 3,opaque:Bool = false) -> some View{
        self
            .background(Blur(radius: radius, opaque: opaque))
    }
    
    /// function for creating the inner shadow of the view
    func innerShadow<S:Shape,SS:ShapeStyle>(shape:S,color:SS,linewidth:CGFloat = 1,offsetX:CGFloat = 0,offsetY:CGFloat = 0,blur:CGFloat = 4,blendMode:BlendMode = .normal,opacity:Double = 1) ->some View
    {
        return self
            .overlay{
             shape
                    .stroke(color,lineWidth: linewidth)
                    .blendMode(blendMode)
                    .offset(x:offsetX,y:offsetY)
                    .blur(radius: blur)
                    .mask(shape)
                    .opacity(opacity)
            }
    }
}
