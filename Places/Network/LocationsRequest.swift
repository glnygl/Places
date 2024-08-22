//
//  LocationsRequest.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import Foundation

class LocationsRequest: BaseRequest {
    var path: String = RequestPath.locations.rawValue
    var method: HTTPMethod = .get
}
