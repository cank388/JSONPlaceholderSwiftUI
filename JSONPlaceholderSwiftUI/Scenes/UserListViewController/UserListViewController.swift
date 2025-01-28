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
                    //Same list but showing 2 ways of doing it
                    VStack {
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
                                                
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                ForEach(viewModel.users, id: \.id) { user in
                                    NavigationLink(destination: UserListDetailViewController(user: user)) {
                                        PersonCell(user: user)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .padding()
                        }
                        .navigationTitle("Users")
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    UserListViewController()
}
