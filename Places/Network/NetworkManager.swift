//
//  NetworkManager.swift
//  Places
//
//  Created by Glny Gl on 20/08/2024.
//

import Foundation

protocol NetworkServiceProtocol {
    var session: URLSession { get }
    func performRequest<T: Codable>(
          type: T.Type,
          with request: URLRequest) async throws -> T
}

extension NetworkServiceProtocol {
    var session: URLSession {
        URLSession.shared
    }
}


class NetworkManager: NetworkServiceProtocol {
    
    func performRequest<T>(type: T.Type, with request: URLRequest) async throws -> T where T : Decodable {
        let (data, response) = try await session.data(for: request)
         guard let httpResponse = response as? HTTPURLResponse else {
             throw NetworkError.requestFailed
         }
         guard httpResponse.statusCode == 200 else {
             throw NetworkError.responseUnsuccessful(description: "status code \(httpResponse.statusCode)")
         }
         do {
             let decoder = JSONDecoder()
             let result = try decoder.decode(type, from: data)
             return result
         } catch {
             throw NetworkError.jsonConversionFailure(description: error.localizedDescription)
         }
    }
}
