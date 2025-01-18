//
//  ForgotPasswordView.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 12.01.25.
//

import SwiftUI

struct ForgotPasswordView: View {
    @StateObject private var viewModel = ForgotPasswordViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("Luminote_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240)
                    .padding()
                
                Text("Passwort zurücksetzen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 16)
                
                Text("Gib Deine Email Adresse ein, um eine Email zum Zurücksetzen Deines Passworts zu erhalten.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                TextField("Deine Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(LuminoteTextFieldModifier())
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                        .padding(.top, 8)
                }
                
                if viewModel.isSuccess {
                    Text("Eine E-Mail zum Zurücksetzen Deines Passworts wurde verschickt!")
                        .foregroundColor(.green)
                        .font(.footnote)
                        .padding(.top, 8)
                }
                
                Button {
                    Task { await viewModel.sendPasswordReset() }
                } label: {
                    Text("Reset Email senden")
                        .modifier(LuminoteButton1Modifier())
                }
                .padding(.top, 16)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    LoginView()
                } label: {
                    HStack(spacing: 3) {
                        Text("Zurück zum")
                        
                        Text("Login")
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
    ForgotPasswordView()
}

