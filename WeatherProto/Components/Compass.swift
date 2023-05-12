//
//  Compass.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/12.
//

import SwiftUI

struct Compass: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color("Information Background"))
                .frame(width: 164, height: 164)
                .shadow(color: .black.opacity(0.25), radius: 10, x: 5, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.white,
                                lineWidth: 0.5)
                        .blendMode(.overlay)
                )
            
            VStack (alignment: .leading, spacing: 16){
                HStack{
                    Image(systemName: "wind")
                    Text("WIND")
                }
                .font(.subheadline)
                ZStack {
                    Circle().strokeBorder(.white, style: StrokeStyle(lineWidth: 3, dash: [1, 2]))
                        .frame(width: 100, height: 100)
                    Circle().strokeBorder(.white, style: StrokeStyle(lineWidth: 6, dash: [2, 18]))
                        .frame(width: 100, height: 100)
                    Text("N")
                        .font(.caption)
                        .offset(radius: 42, degree: 270)
                    Text("S")
                        .font(.caption)
                        .offset(radius: 42, degree: 90)
                    Text("E")
                        .font(.caption)
                        .offset(radius: 42, degree: 0)
                    Text("W")
                        .font(.caption)
                        .offset(radius: 42, degree: 180)
                    VStack(spacing: 0){
                        Text("9.7")
                        Text("Km")
                            .font(.caption)
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
    
    var grident: LinearGradient {
        LinearGradient(colors: [Color(#colorLiteral(red: 0.6196078431, green: 0.6274509804, blue: 0.7098039216, alpha: 1)), .black], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct Compass_Previews: PreviewProvider {
    static var previews: some View {
        Compass()
            //.preferredColorScheme(.dark)
    }
}
