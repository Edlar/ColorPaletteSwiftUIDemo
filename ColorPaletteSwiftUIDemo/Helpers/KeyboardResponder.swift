//
//  KeyboardResponder.swift
//  ColorPaletteSwiftUIDemo
//
//  Created by Eduard Laryushkin on 28.07.2020.
//  Copyright © 2020 edlar.ru. All rights reserved.
//

import SwiftUI

// Подъём элементов над клавиатурой
final class KeyboardResponder: ObservableObject {
    @Published private(set) var currentHeight: CGFloat = 0
    
    private var notificationCenter: NotificationCenter
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            currentHeight = keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        currentHeight = 0
    }
    
    init(center: NotificationCenter = .default) {
        notificationCenter = center
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
}
