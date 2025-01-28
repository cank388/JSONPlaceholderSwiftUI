//
//  UserEndpoints.swift
//  JSONPlaceholderSwiftUI
//
//  Created by Can Kalender on 28.01.2025.
//

import Foundation

enum UserEndpoint {
    case getUsers
    case getUser(id: Int)
}

extension UserEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .getUser(let id):
            return "/users/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers, .getUser:
            return .get
        }
    }
}
