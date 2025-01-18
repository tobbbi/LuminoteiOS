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
                TextField("Deine Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(LuminoteTextFieldModifier())
                
                SecureField("Dein Passwort", text: $viewModel.password)
                    .modifier(LuminoteTextFieldModifier())
                
                VStack {
                    TextField("Dein Anzeigename", text: $viewModel.fullname)
                    .modifier(LuminoteTextFieldModifier())
                    
                    VStack {
                        TextField("Dein Username", text: $viewModel.username)
                        .autocapitalization(.none)
                    .modifier(LuminoteTextFieldModifier())
                        
                    }
                        
                        Button {
                            Task { try await viewModel.createUser() }
                        } label: {
                            Text("Registrieren")
                                .modifier(LuminoteButton1Modifier())
                        }
                        .padding(.vertical)
                    
                    Spacer()
                    
                    Divider()
                    
                    Button {
                        dismiss()
                    } label: {
                        HStack(spacing: 3) {
                            Text("Du hast schon einen Account?")
                            
                            Text("Melde dich an!")
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
