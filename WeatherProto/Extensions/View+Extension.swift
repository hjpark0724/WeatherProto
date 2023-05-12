//
//  View+Extension.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import SwiftUI

extension View {
    func innerShadow<S: Shape, SS: ShapeStyle>(shape: S, color: SS, lineWidth: CGFloat = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 0, blur: CGFloat = 4, blendMode: BlendMode = .normal, opacity: Double = 1) -> some View {
        return self
            .overlay {
                shape
                    .stroke(color, lineWidth: lineWidth)
                    .blendMode(blendMode)
                    .offset(x: offsetX, y: offsetY)
                    .blur(radius: blur)
                    .mask(shape)
                    .opacity(opacity)
            }
    }
}



extension View {
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        self.background(Blur(radius: radius, opaque: opaque))
    }
}


struct PolarPointOffset: ViewModifier {
    let radius: CGFloat
    let degree: CGFloat
    
    func body(content: Content) -> some View {
        content
            .offset(
                x: radius * cos(degree * .pi / 180),
                y: radius * sin(degree * .pi / 180))
    }
}


extension View {
    func offset(radius: CGFloat, degree: CGFloat) -> some View {
        modifier(PolarPointOffset(radius: radius, degree: degree))
    }
}
