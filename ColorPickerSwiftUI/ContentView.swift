//
//  ContentView.swift
//  ColorPickerSwiftUI
//
//  Created by Oksana Tugusheva on 06.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack {
            Color(white: 0.95)
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 200)
                    .foregroundColor(Color(red: red/255, green: green/255, blue: blue/255))
                    .padding()
                ColorLine(value: $red, label: "Red", sliderColor: .red)
                ColorLine(value: $green, label: "Green", sliderColor: .green)
                ColorLine(value: $blue, label: "Blue", sliderColor: .blue)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
