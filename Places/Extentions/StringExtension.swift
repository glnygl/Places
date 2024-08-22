//
//  StringExtension.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import Foundation

extension String {
    
    func localize(comment: String = "", bundle: Bundle = .main, locale: Locale = .current) -> String {
        let defaultLanguage = "en"
        let value = NSLocalizedString(self, comment: comment)
        if value != self || locale.language.languageCode?.identifier == defaultLanguage {
            return value
        }
        guard let path = bundle.path(forResource: defaultLanguage, ofType: "lproj"),
              let bundle = Bundle(path: path) else { return value }
        return NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
