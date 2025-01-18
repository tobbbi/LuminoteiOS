//
//  ForgotPasswordViewModel.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 12.01.25.
//

import Foundation
import Firebase

class ForgotPasswordViewModel: ObservableObject {
    @Published var email = ""
    @Published var errorMessage: String?
    @Published var isSuccess = false
    
    @MainActor
    func sendPasswordReset() async {
        guard !email.isEmpty else {
            errorMessage = "Please enter your email address."
            return
        }
        
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
            isSuccess = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

