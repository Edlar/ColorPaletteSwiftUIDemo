//
//  RootView.swift
//  ColorPaletteSwiftUIDemo
//
//  Created by Eduard Laryushkin on 25.07.2020.
//  Copyright © 2020 edlar.ru. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State var redValue = Double.random(in: 0...255)
    @State var greenValue = Double.random(in: 0...255)
    @State var blueValue = Double.random(in: 0...255)
    
    @ObservedObject private var keyboard = KeyboardResponder()
    
    private let red = Color(.red)
    private let green = Color(.green)
    private let blue = Color(.blue)
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
            Color(red: redValue / 255,
                  green: greenValue / 255,
                  blue: blueValue / 255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                VStack {
                    SliderView(sliderValue: $redValue,
                               sliderColor: red)
                    Spacer()
                    SliderView(sliderValue: $greenValue,
                               sliderColor: green)
                    Spacer()
                    SliderView(sliderValue: $blueValue,
                               sliderColor: blue)
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
