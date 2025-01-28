//
//  UserListViewModel.swift
//  JSONPlaceholderSwiftUI
//
//  Created by Can Kalender on 28.01.2025.
//

import Foundation

@MainActor
class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading = false
    @Published var error: String?
    
    func fetchUsers() {
        isLoading = true
        error = nil
        
        Task {
            do {
                users = try await NetworkManager.shared.fetchUsers()
            } catch {
                self.error = error.localizedDescription
            }
            isLoading = false
        }
    }
}
