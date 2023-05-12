//
//  RainFallCard.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/12.
//

import SwiftUI

struct RainFallCard: View {
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
                    Image(systemName: "drop.fill")
                    Text("RAINFALL")
                }
                Text("1.8 mm")
                .font(.title)
                .lineLimit(-1)
                .multilineTextAlignment(.leading)
                
                //.padding(.horizontal, 16)
                Text("1.2 mm expected in next 24")
                    .font(.subheadline)
                  //  .padding(.horizontal, 16)
            }
            .padding()
        }
        .frame(maxWidth: 164, maxHeight: 164)
        .foregroundColor(.white)
    }
}

struct RainFallCard_Previews: PreviewProvider {
    static var previews: some View {
        RainFallCard()
    }
}
