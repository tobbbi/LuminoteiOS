//
//  FriendsViewModel.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 09.01.25.
//

import Foundation

class FriendsViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
