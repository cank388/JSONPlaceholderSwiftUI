//
//  UserListViewController.swift
//  JSONPlaceholderSwiftUI
//
//  Created by Can Kalender on 28.01.2025.
//

import SwiftUI

struct UserListViewController: View {
    @StateObject private var viewModel = UserListViewModel()
    
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.error {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.users, id: \.id) { user in
                        NavigationLink(destination: UserListDetailViewController(user: user)) {
                            VStack(alignment: .leading) {
                                Text(user.name ?? "Unknown")
                                    .font(.headline)
                                Text(user.email ?? "No email")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Users")
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    UserListViewController()
}
