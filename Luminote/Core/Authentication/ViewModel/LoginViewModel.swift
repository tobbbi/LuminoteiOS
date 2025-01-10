//
//  LoginViewModel.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 08.01.25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password) 
    }
}
