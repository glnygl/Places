//
//  FormatHelper.swift
//  Places
//
//  Created by Glny Gl on 21/08/2024.
//

import Foundation

struct Formatters {
    static var locationFormatter: Formatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.maximumFractionDigits = 8
        formatter.zeroSymbol  = ""
        return formatter
    }
}
