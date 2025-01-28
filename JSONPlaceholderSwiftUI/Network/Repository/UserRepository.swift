//
//  UserRepository.swift
//  JSONPlaceholderSwiftUI
//
//  Created by Can Kalender on 28.01.2025.
//

import Foundation

protocol UserRepositoryProtocol {
    func getUsers() async throws -> [User]
    func getUser(id: Int) async throws -> User
}

class UserRepository: UserRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkManager.shared) {
        self.networkService = networkService
    }
    
    func getUsers() async throws -> [User] {
        try await networkService.request(endpoint: UserEndpoint.getUsers)
    }
    
    func getUser(id: Int) async throws -> User {
        try await networkService.request(endpoint: UserEndpoint.getUser(id: id))
    }
}
