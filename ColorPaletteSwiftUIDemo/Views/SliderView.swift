//
//  SliderView.swift
//  ColorPaletteSwiftUIDemo
//
//  Created by Eduard Laryushkin on 25.07.2020.
//  Copyright © 2020 edlar.ru. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    
    let sliderColor: Color
    
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
            TextFieldView(textFieldValue: $sliderValue,
                          sliderColor: sliderColor)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(100), sliderColor: .red)
    }
}
