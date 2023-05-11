//
//  SegmentControl.swift
//  WeatherProto
//
//  Created by HYEONJUN PARK on 2023/05/11.
//

import SwiftUI

struct SegmentControl: View {
    @Binding var selection: Int
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 0
                    }
                } label: {
                    Text("Hourly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 1
                    }
                } label: {
                    Text("Daily Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.white)
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                //.background(.black.opacity(0.5))
                .overlay {
                    HStack {
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                            .background(Color.underline)
                    }
                    .frame(maxWidth: .infinity, alignment: selection == 0 ? .leading : .trailing)
                    .offset(y: -1)
                }
        }
        .padding(.top, 25)
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentControl(selection: .constant(0))
    }
}
