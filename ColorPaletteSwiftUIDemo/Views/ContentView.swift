//
//  ContentView.swift
//  ColorPaletteSwiftUIDemo
//
//  Created by Eduard Laryushkin on 25.07.2020.
//  Copyright © 2020 edlar.ru. All rights reserved.
//

import SwiftUI

struct ContentView: View {
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
        ContentView()
    }
}

// MARK: Body
extension ContentView {
    var body: some View {
        ZStack {
            Color(UIColor(displayP3Red: CGFloat(redSliderValue),
                          green: CGFloat(greenSliderValue),
                          blue: CGFloat(blueSliderValue),
                          alpha: 1))
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
extension ContentView {
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

// MARK: KeyboardResponder
// Подъём элементов над клавиатурой
final class KeyboardResponder: ObservableObject {
    private var notificationCenter: NotificationCenter
    @Published private(set) var currentHeight: CGFloat = 0
    
    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyBoardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    @objc func keyBoardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }
    
    @objc func keyBoardWillHide(notification: Notification) {
        currentHeight = 0
    }
}
