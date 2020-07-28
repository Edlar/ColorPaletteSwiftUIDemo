//
//  RootView.swift
//  ColorPaletteSwiftUIDemo
//
//  Created by Eduard Laryushkin on 25.07.2020.
//  Copyright © 2020 edlar.ru. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State var redSliderValue = Double.random(in: 0...255)
    @State var greenSliderValue = Double.random(in: 0...255)
    @State var blueSliderValue = Double.random(in: 0...255)
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    private let redSliderColor = Color(.red)
    private let greenSliderColor = Color(.green)
    private let blueSliderColor = Color(.blue)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

// MARK: Body
extension RootView {
    var body: some View {
        ZStack {
            Color(red: redSliderValue / 255,
                  green: greenSliderValue / 255,
                  blue: blueSliderValue / 255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack {
                    SliderView(sliderValue: $redSliderValue,
                               sliderColor: redSliderColor)
                    Spacer()
                    SliderView(sliderValue: $greenSliderValue,
                               sliderColor: greenSliderColor)
                    Spacer()
                    SliderView(sliderValue: $blueSliderValue,
                               sliderColor: blueSliderColor)
                }
                .frame(height: 300)
                .padding(20)
                .background(Blur())
                .cornerRadius(20)
                .padding(.bottom, keyboard.currentHeight)
            }
            .padding(16)
        }
    }
}

// MARK: Blur
// Blur для Background
extension RootView {
    struct Blur: UIViewRepresentable {
        let style: UIBlurEffect.Style = .systemMaterial
        func makeUIView(context: Context) -> UIVisualEffectView {
            return UIVisualEffectView(effect: UIBlurEffect(style: style))
        }
        func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
            uiView.effect = UIBlurEffect(style: style)
        }
    }
}
