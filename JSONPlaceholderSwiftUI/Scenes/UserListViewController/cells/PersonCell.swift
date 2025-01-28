//
//  PersonCell.swift
//  JSONPlaceholderSwiftUI
//
//  Created by Can Kalender on 28.01.2025.
//

import SwiftUI

struct PersonCell: View {
    let user: User
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.blue.opacity(0.2))
                .frame(width: 40, height: 40)
                .overlay(
                    Text(String(user.name?.prefix(1) ?? "?"))
                        .foregroundColor(.blue)
                        .font(.title2)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.name ?? "Unknown")
                    .font(.headline)
                    .foregroundColor(.black)
                Text(user.phone ?? "No phone")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray.opacity(0.2), radius: 5)
    }
}

#Preview {
    PersonCell(user: User(id: 1, name: "John Doe", username: "johndoe", email: "john@example.com", address: Address(street: "123 Elm St.", suite: "Suite 2", city: "Springfield", zipcode: "62704", geo: GeoLocation(latitude: "37.3598", longitude: "-93.2820")), phone: "555-1234", website: "www.johndoe.com", company: Company(name: "Example Inc.", catchPhrase: "We do it right!", businessStrategy: "BS1")))
}
