//
//  UserListDetailViewController.swift
//  JSONPlaceholderSwiftUI
//
//  Created by Can Kalender on 28.01.2025.
//

import SwiftUI

struct UserListDetailViewController: View {
    @StateObject private var viewModel: UserListDetailViewModel
    
    init(user: User) {
        _viewModel = StateObject(wrappedValue: UserListDetailViewModel(user: user))
    }
    
    var body: some View {
        Form {
            Section(header: Text("Personal Information")) {
                InfoRow(title: "Name", value: viewModel.user.name ?? "N/A")
                InfoRow(title: "Username", value: viewModel.user.username ?? "N/A")
                InfoRow(title: "Email", value: viewModel.user.email ?? "N/A")
                InfoRow(title: "Phone", value: viewModel.user.phone ?? "N/A")
                InfoRow(title: "Website", value: viewModel.user.website ?? "N/A")
            }
            
            Section(header: Text("Address")) {
                InfoRow(title: "Street", value: viewModel.user.address?.street ?? "N/A")
                InfoRow(title: "Suite", value: viewModel.user.address?.suite ?? "N/A")
                InfoRow(title: "City", value: viewModel.user.address?.city ?? "N/A")
                InfoRow(title: "Zipcode", value: viewModel.user.address?.zipcode ?? "N/A")
            }
            
            Section(header: Text("Company")) {
                InfoRow(title: "Name", value: viewModel.user.company?.name ?? "N/A")
                InfoRow(title: "Catch Phrase", value: viewModel.user.company?.catchPhrase ?? "N/A")
                InfoRow(title: "BS", value: viewModel.user.company?.businessStrategy ?? "N/A")
            }
        }
        .navigationTitle(viewModel.user.name ?? "User Details")
    }
}

struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
        }
    }
}

#Preview {
    UserListDetailViewController(user: User(id: 1, name: "John Doe", username: "johndoe", email: "john@example.com", address: Address(street: "123 Elm St.", suite: "Suite 2", city: "Springfield", zipcode: "62704", geo: GeoLocation(latitude: "37.3598", longitude: "-93.2820")), phone: "555-1234", website: "www.johndoe.com", company: Company(name: "Example Inc.", catchPhrase: "We do it right!", businessStrategy: "BS1")))
}
