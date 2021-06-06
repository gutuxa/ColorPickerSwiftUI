//
//  ColorLine.swift
//  ColorPickerSwiftUI
//
//  Created by Oksana Tugusheva on 06.06.2021.
//

import SwiftUI

struct ColorLine: View {
    @Binding var value: Double
    
    let label: String
    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text("\(label):")
                .font(.title2)
                .bold()
                .frame(width: 70, alignment: .leading)
            Text("\(lround(value))")
                .font(.title3)
                .frame(width: 40, alignment: .trailing)
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(sliderColor)
            ColorInput(value: $value)
                .frame(width: 60)
                .font(.title3)
        }
        .padding(.horizontal)
    }
}

struct ColorLine_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(white: 0.8)
                .ignoresSafeArea()
            ColorLine(value: .constant(23.0), label: "Red", sliderColor: .red)
        }
    }
}
