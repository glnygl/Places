//
//  LocationsViewModel.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import Foundation
import Observation

@Observable
final class LocationsViewModel: ObservableObject {
    
    var locations: [Location] = []
    
    func fetchLocations(manager: NetworkService = NetworkManager()) async throws {
        let request = LocationsRequest()
        let locationsList = try await manager.performRequest(type: Locations.self, with: request.asURLRequest())
        locations = locationsList.locations ?? []
    }
    
    func redirectUrl(location: Location) {
        DeeplinkHelper().redirectUrl(location: location)
    }
    
}
