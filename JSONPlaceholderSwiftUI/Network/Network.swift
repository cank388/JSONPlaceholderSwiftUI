//
//  Network.swift
//  JSONPlaceholderSwiftUI
//
//  Created by Can Kalender on 28.01.2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case networkError(Error)
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
}

protocol NetworkServiceProtocol {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
}

class NetworkManager: NetworkServiceProtocol {
    static let shared = NetworkManager()
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    private init() {}
    
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        guard let url = URL(string: "\(baseURL)\(endpoint.path)") else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
