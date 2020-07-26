//
//  SliderView.swift
//  PaletteSwiftUIDemo
//
//  Created by Eduard Laryushkin on 25.07.2020.
//  Copyright © 2020 edlar.ru. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var sliderColor: Color
    
    private let textColor = Color(UIColor.systemGray)
    
    var body: some View {
        VStack {
            HStack {
                Text("0")
                    .foregroundColor(textColor)
                Slider(value: $sliderValue, in: 0...255, step: 1)
                    .accentColor(sliderColor)
                Text("255")
                    .foregroundColor(textColor)
            }
            TextField("0", value: $sliderValue, formatter: NumberFormatter())
                .multilineTextAlignment(.center)
                .padding(5)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(sliderColor, lineWidth: 2))
                .frame(width: 100)
                .keyboardType(.numberPad)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    @State static var sliderValue = 100.0
    
    static var previews: some View {
        SliderView(sliderValue: $sliderValue, sliderColor: .red)
    }
}
