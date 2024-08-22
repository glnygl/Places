//
//  StringExtensionTests.swift
//  PlacesTests
//
//  Created by Glny Gl on 22/08/2024.
//

import XCTest
@testable import Places

final class StringExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_localize_ifKeyExist() {

        let key = "placesTitle"
        let mockBundle = Bundle(for: type(of: self))
        let mockLocale = Locale(identifier: "en")
        
        let localizedString = key.localize(bundle: mockBundle, locale: mockLocale)
        
        XCTAssertNotEqual(localizedString, key, "exist key")
    }
    
    func test_localize_ifKeyNotExist() {
        
        let key = "noExistKey"
        let mockBundle = Bundle(for: type(of: self))
        let mockLocale = Locale(identifier: "en")
        
        let localizedString = key.localize(bundle: mockBundle, locale: mockLocale)
        
        XCTAssertEqual(localizedString, key, "no exist key")
    }
    
    
    
}
