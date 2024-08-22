//
//  BaseRequest.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import Foundation

enum NetworkError: Error {
    case requestFailed
    case jsonConversionFailure(description: String)
    case responseUnsuccessful(description: String)
    case invalidURL(url: String)
    case parameterEncodingFailed
}

enum CustomError: Error {
    case redirectFailed
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum RequestPath: String {
    case locations = "/main/locations.json"
}

protocol BaseRequest {

    var url: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String : String] { get }
    
    var queryParams: Codable? { get }
    var bodyParams: Codable? { get }
    
    func asURLRequest() throws -> URLRequest
}

extension BaseRequest {
    var headers: [String : String] { [:] }
    var bodyParams: Codable? { nil }
    var queryParams: Codable? { nil }
}

extension BaseRequest {
    
    var url: String {
        "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios"
    }
    
    func asURLRequest() throws -> URLRequest {
        var query = ""
        if let queryParams = queryParams {
            query = try queryParams.dictionary().queryString()
        }
        let endpoint = url  + path + query
        
        guard let url = URL(string: endpoint)
        else {
            throw NetworkError.invalidURL(url: endpoint)
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = self.method.rawValue

        if let bodyParams = bodyParams {
            do {
                let body = try JSONEncoder().encode(bodyParams)
                urlRequest.httpBody = body
            } catch {
                throw NetworkError.parameterEncodingFailed
            }
        }
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}
