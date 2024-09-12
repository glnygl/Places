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
    
    var manager: NetworkServiceProtocol
    var helper: RedirectableProtocol
    
    var showPopop = false
    
    init(manager: NetworkServiceProtocol, helper: RedirectableProtocol) {
        self.manager = manager
        self.helper = helper
    }
    
    func fetchLocations() async throws {
        let request = LocationsRequest()
        let locationsList = try await manager.performRequest(type: Locations.self, with: request.asURLRequest())
        locations = locationsList.locations ?? []
    }
    
    func redirectUrl(location: Location) {
        helper.redirectUrl(location: location)
    }
    
}
