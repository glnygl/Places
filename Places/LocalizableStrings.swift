//
//  LocalizableStrings.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import Foundation

struct LocalizableStrings {
    
    struct Titles {
        static var placesTitle: String { "placesTitle".localize() }
    }
    
    struct LocationTitles {
        static var noName: String { "noName".localize() }
    }
    
    struct ButtonTitles {
        static var custom: String { "custom".localize() }
        static var goToWiki: String { "goToWiki".localize() }
    }
    
    struct Error {
        static var error: String { "error".localize() }
        static var checkLocation: String { "checkLocation".localize() }
    }
    
    struct AccessibilityStrings {
        static var click: String { "click".localize() }
        static var type: String { "type".localize() }
    }
}


