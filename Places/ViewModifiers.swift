//
//  ViewModifier.swift
//  Places
//
//  Created by Glny Gl on 22/08/2024.
//

import SwiftUI

struct AccessibilityModifier: ViewModifier {
    let label: String 
    let hint: String
    let identifier: String
    
    func body(content: Content) -> some View {
        content
            .accessibilityLabel(label)
            .accessibilityHint(hint)
            .accessibilityIdentifier(identifier)
    }
}
