//
//  LocationsView.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import SwiftUI

struct LocationsView: View {
    
    @State var viewModel = LocationsViewModel(manager: NetworkManager(), helper: DeeplinkHelper())
    
    var body: some View {
        NavigationStack {
            List(viewModel.locations, id: \.name) { location in
                Button(location.name ?? LocalizableStrings.LocationTitles.noName) {
                    viewModel.redirectUrl(location: location)
                }
                .setAccessibility(label: "\(location.name ?? LocalizableStrings.LocationTitles.noName)", hint: LocalizableStrings.AccessibilityStrings.click, identifier: "btn_location")
                .foregroundStyle(.black)
            }
            .toolbar {
                Button(LocalizableStrings.ButtonTitles.custom) {
                    viewModel.showPopop = true
                }
                .setAccessibility(label: LocalizableStrings.ButtonTitles.custom, hint: LocalizableStrings.AccessibilityStrings.click, identifier: "btn_custom_location")
            }
            .popover(isPresented: $viewModel.showPopop) {
                PopupView()
            }
            .navigationTitle(LocalizableStrings.Titles.placesTitle)
            .task {
                do {
                    try await viewModel.fetchLocations()
                }
                catch {
                    print(NetworkError.requestFailed)
                }
            }
        }
    }
}

#Preview {
    LocationsView()
}
