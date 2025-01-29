# JSONPlaceholder Project
This is SwiftUI version of this project: https://github.com/cank388/JSONPlaceholderProject
This iOS project is used [JSONPlaceholder API](https://jsonplaceholder.typicode.com/).

## Architecture & Design Patterns

- **MVVM (Model-View-ViewModel)** architecture
- **Coordinator** pattern for navigation management (AppCoordinator, Coordinator, UserCoordinator)
- **Repository** pattern for data layer abstraction (UserRepository)
- **Dependency Injection** principle

## Technical Specifications

- Swift 5
- XCode 15.2
- iOS 17.2
- URLSession-based networking layer
- JSON parsing and encoding/decoding
```
## Project Structure
JSONPlaceholderProject/
├── App/
│ ├── AppDelegate.swift
│ └── SceneDelegate.swift
├── Network/
│ ├── Network.swift
│ └── Models/
│   └── UserListModel.swift
│ └── Repository/
│   └── UserRepository.swift
│ └── Endpoints/
│   └── UserEndpoint.swift
└── Scenes/
│ └── UserList/
│   └── UserListViewController.swift
│   └── UserListViewModel.swift
│   └── Cells/
│     └── PersonCell.swift
│ └── UserListDetail/
│   └── UserListDetailViewController.swift
│   └── UserListDetailViewModel.swift
```
<img src="https://github.com/user-attachments/assets/723fe2b0-4820-495c-b8c1-4e00d66a37aa" alt="image" width="300">
<img src="https://github.com/user-attachments/assets/fddb8371-3673-4578-9394-b3098c573129" alt="image" width="300">





