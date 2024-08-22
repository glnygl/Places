//
//  MockNetworkManager.swift
//  PlacesTests
//
//  Created by Glny Gl on 22/08/2024.
//

import Foundation
@testable import Places

class MockNetworkManager: NetworkService, Mockable {
    var shouldThrowError = false
    var mockLocations: Locations?
    
    func performRequest<T: Decodable>(type: T.Type, with request: URLRequest) async throws -> T {
        if shouldThrowError {
            throw NetworkError.requestFailed
        }
        
        let data = loadJson(fileName: "LocationDummy", type: Locations.self)
        mockLocations = data
        return data as! T
    }
}
