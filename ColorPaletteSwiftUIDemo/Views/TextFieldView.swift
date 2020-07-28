//
//  TextFieldView.swift
//  ColorPaletteSwiftUIDemo
//
//  Created by Eduard Laryushkin on 28.07.2020.
//  Copyright © 2020 edlar.ru. All rights reserved.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var textFieldValue: Double
    
    let strokeColor: Color
    
    var body: some View {
        TextField("0", value: $textFieldValue, formatter: NumberFormatter()) {
            if !(0...255).contains(self.textFieldValue) {
                self.textFieldValue = 0
            }
        }
        .multilineTextAlignment(.center)
        .padding(5)
        .overlay(RoundedRectangle(cornerRadius: 10)
        .stroke(strokeColor, lineWidth: 2))
        .frame(width: 100)
        //                .keyboardType(.numberPad)
        //                Без кнопки Done значение не присваивается
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textFieldValue: .constant(100), strokeColor: .red)
    }
}
