//
//  ColorInput.swift
//  ColorPickerSwiftUI
//
//  Created by Oksana Tugusheva on 06.06.2021.
//

import SwiftUI

struct ColorInput: View {
    @Binding var value: Double
    
    @State private var text = ""
    @State private var alertPresented = false
    
    var body: some View {
        TextField(
            "",
            text: $text,
            onCommit: { validate(newValue: text) }
        )
            .onAppear(perform: { text = format(value) })
            .onChange(of: value) { text = format($0) }
            .alert(isPresented: $alertPresented) {
                Alert(
                    title: Text("Wrong Format!"),
                    message: Text("Enter number from 0 to 255.")
                )
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke()
                    .foregroundColor(Color(white: 0.9))
            )
    }
    
    private func format(_ value: Double) -> String {
        "\(lround(value))"
    }
    
    private func validate(newValue: String) {
        if let number = Double(newValue), (0...255).contains(number) {
            value = number
        } else {
            text = format(value)
            alertPresented = true
        }
    }
}

struct ColorInput_Previews: PreviewProvider {
    static var previews: some View {
        ColorInput(value: .constant(24.0)).padding()
    }
}
