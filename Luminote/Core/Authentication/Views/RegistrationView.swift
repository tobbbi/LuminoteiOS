//
//  RegistrationView.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 07.01.25.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            Image("Luminote_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 240)
                .padding()
            
            VStack {
                TextField("Enter you email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(LuminoteTextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(LuminoteTextFieldModifier())
                
                VStack {
                    TextField("Enter you full name", text: $viewModel.fullname)
                    .modifier(LuminoteTextFieldModifier())
                    
                    VStack {
                        TextField("Enter you username", text: $viewModel.username)
                        .autocapitalization(.none)
                    .modifier(LuminoteTextFieldModifier())
                        
                    }
                        
                        Button {
                            Task { try await viewModel.createUser() }
                        } label: {
                            Text("Sign up")
                                .modifier(LuminoteButton1Modifier())
                        }
                        .padding(.vertical)
                    
                    Spacer()
                    
                    Divider()
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Already have an account?")
                            
                            Text("Sign in")
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.black)
                        .font(.footnote)
                    }
                    .padding(.vertical, 16)
                    }
                }
            }
        }
    }

#Preview {
    RegistrationView()
}
