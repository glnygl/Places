//
//  Locations.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import Foundation

struct Locations: Codable {
    let locations: [Location]?
}

struct Location: Codable, Hashable {
    let name: String?
    let lat: Double?
    let long: Double?
}


