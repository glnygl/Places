//
//  FormatterTests.swift
//  PlacesTests
//
//  Created by Glny Gl on 22/08/2024.
//

import XCTest
@testable import Places

final class FormatterTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_locationFormatter_formatsSuccess() {
        
        let formatter = Formatters.locationFormatter
        let number = 123.45678901
        let formattedString = formatter.string(for: number) ?? ""
        
        XCTAssertEqual(formattedString, "123,45678901")
    }
    
    func test_locationFormatter_formatsError() {
        
        let formatter = Formatters.locationFormatter
        let number = 123.45678901
        let formattedString = formatter.string(for: number) ?? ""
        
        XCTAssertNotEqual(formattedString, "123.45678901")
    }
    
    func test_locationFormatter_formatsZero() {
        
        let formatter = Formatters.locationFormatter
        let number = 0
        let formattedString = formatter.string(for: number) ?? ""
        
        XCTAssertEqual(formattedString, "")
    }

}
