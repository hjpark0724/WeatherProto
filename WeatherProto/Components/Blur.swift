//
//  Blur.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import SwiftUI

class UIBackDropView: UIView {
    override class var layerClass: AnyClass {
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

struct BackDrop: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        UIBackDropView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
}

struct Blur: View {
    var radius: CGFloat = 3
    var opaque: Bool = false
    
    var body: some View {
        BackDrop()
            .blur(radius: radius, opaque: opaque)
    }
}


struct Blur_Previews: PreviewProvider {
    static var previews: some View {
        Blur()
    }
}
