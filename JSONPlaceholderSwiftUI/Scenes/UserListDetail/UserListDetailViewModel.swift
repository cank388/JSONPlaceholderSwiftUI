//
//  UserListDetailViewModel.swift
//  JSONPlaceholderSwiftUI
//
//  Created by Can Kalender on 28.01.2025.
//

import Foundation

class UserListDetailViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
}
