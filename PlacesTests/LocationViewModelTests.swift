//
//  LocationViewModelTests.swift
//  PlacesTests
//
//  Created by Glny Gl on 22/08/2024.
//

import XCTest
@testable import Places

final class LocationViewModelTests: XCTestCase {
    
    var mockNetworkManager: MockNetworkManager!
    var helper: DeeplinkHelper!
    var locationViewModel: LocationsViewModel!

    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        helper = DeeplinkHelper()
        locationViewModel = LocationsViewModel(manager: mockNetworkManager, helper: helper)
    }
    
    override func tearDown() {
        mockNetworkManager = nil
        locationViewModel = nil
        super.tearDown()
    }
    
    
    func test_fetchLocations_Successfully() async throws {
        
        try await locationViewModel.fetchLocations()
        
        XCTAssertTrue(locationViewModel.locations.count > 0)
        
    }
    
    func test_fetchLocations_Failed() async throws {

        mockNetworkManager.shouldThrowError = true
        
        do {
            try await locationViewModel.fetchLocations()
            XCTFail("Expected fetchLocations to throw an error, but it succeeded.")
        } catch {
            XCTAssertEqual(locationViewModel.locations.count, 0)
        }
    }

}
