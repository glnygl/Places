//
//  DeeplinkHelper.swift
//  Places
//
//  Created by Glny Gl on 21/08/2024.
//

import UIKit

struct DeeplinkHelper {
    
    func redirectUrl(location: Location) {
        var queryString = ""
        do {
            queryString = try location.dictionary().queryString()
        } catch {
            print(CustomError.redirectFailed)
            return
        }
        let wikipedia = URL(string: "wikipedia://places/glny\(queryString)")!
        if UIApplication.shared.canOpenURL(wikipedia) {
            UIApplication.shared.open(wikipedia)
        }
    }
}
