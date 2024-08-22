//
//  PopupView.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import SwiftUI

struct PopupView: View {
    
    @State var lat: Double = 0.0
    @State var long: Double = 0.0    
    @State private var showAlert = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            TextField(
                "lat.",
                value: $lat, formatter: Formatters.locationFormatter
            ).textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
            TextField(
                "long.",
                value: $long, formatter: Formatters.locationFormatter
            ).textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
            Button(action: {
                if lat == 0.0 || long == 0.0  {
                    showAlert = true
                    return
                }
                DeeplinkHelper().redirectUrl(location: Location(name: LocalizableStrings.ButtonTitles.custom, lat: lat, long: long))
            }, label: {
                Text(LocalizableStrings.ButtonTitles.goToWiki)
            })
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
