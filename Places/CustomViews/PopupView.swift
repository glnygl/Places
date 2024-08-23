//
//  PopupView.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import SwiftUI

struct PopupView: View {
    @State var latString: String = ""
    @State var longString:  String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            TextField("lat.", text: $latString)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
                .setAccessibility(label: "lat.", hint: LocalizableStrings.AccessibilityStrings.type, identifier: "txt_lat")
            TextField("long.", text: $longString)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
                .setAccessibility(label:  "long.", hint: LocalizableStrings.AccessibilityStrings.type, identifier: "txt_long")
            Button(action: {
                if latString.isEmpty || longString.isEmpty {
                    showAlert = true
                    return
                }
                DeeplinkHelper().redirectUrl(location: Location(name: LocalizableStrings.ButtonTitles.custom, lat: Double(latString.replaceComma()), long: Double(longString.replaceComma())))
            }, label: {
                Text(LocalizableStrings.ButtonTitles.goToWiki)
            })
            .setAccessibility(label: LocalizableStrings.ButtonTitles.goToWiki, hint: LocalizableStrings.AccessibilityStrings.click, identifier: "btn_wiki")
        })
        .alert(isPresented: $showAlert) {
            Alert(title: Text(LocalizableStrings.Error.error), message: Text(LocalizableStrings.Error.checkLocation), dismissButton: .cancel())
        }
        .padding([.leading, .trailing])
    }
}

#Preview {
    PopupView()
}
