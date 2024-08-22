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
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            TextField(
                "lat.",
                value: $lat, formatter: Formatters.locationFormatter
            ).textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            TextField(
                "long.",
                value: $long, formatter: Formatters.locationFormatter
            ).textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            Button(action: {
               print(lat)
                print(long)
            }, label: {
                Text(LocalizableStrings.ButtonTitles.goToWiki)
            })
        }).padding([.leading, .trailing])
    }
}

#Preview {
    PopupView()
}
