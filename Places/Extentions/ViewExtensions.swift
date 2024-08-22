//
//  ViewExtensions.swift
//  Places
//
//  Created by Glny Gl on 22/08/2024.
//

import SwiftUI

extension View {
    
    func setAccessibility(label: String, hint: String, identifier: String) -> some View {
        self.modifier(AccessibilityModifier(label: label, hint: hint, identifier: identifier))
    }
                      
}
