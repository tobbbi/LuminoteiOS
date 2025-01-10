//
//  LoginView.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 07.01.25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
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
                }
                
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task { try await viewModel.login()}
                } label: {
                    Text("Login")
                        .modifier(LuminoteButton1Modifier())
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        
                        Text("Sign up")
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
    
#Preview {
    LoginView()
}
