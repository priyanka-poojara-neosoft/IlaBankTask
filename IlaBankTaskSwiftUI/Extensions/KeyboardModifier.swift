//
//  KeyboardModifier.swift
//  IlaBankTaskSwiftUI
//
//  Created by Priyanka on 05/09/24.
//

import SwiftUI

struct DismissKeyboardOnTapModifier: ViewModifier {
    @FocusState private var isFocused: Bool // Focus state for the text fields
    
    func body(content: Content) -> some View {
        content
            .focused($isFocused) // Apply focus state to the content
            .onTapGesture {
                isFocused = false // Dismiss the keyboard when tapping outside
            }
    }
}

extension View {
    // Custom extension to apply the modifier
    func dismissKeyboardOnTap() -> some View {
        modifier(DismissKeyboardOnTapModifier())
    }
}
