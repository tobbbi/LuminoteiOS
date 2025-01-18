//
//  MenuView.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 11.01.25.
// FB tutorial .com/watch?v=u8U6E3Sdng8&list=PLZLIINdhhNsdfuUjaCeWGLM_KRezB4-Nk&index=11

import SwiftUI

struct MenuView: View {
    @State private var showLogoutAlert: Bool = false
    var body: some View {
        NavigationView {
            ScrollView {
                MenuCell(title: "Notifications", imageName: "bell")
                MenuCell(title: "Account", imageName: "lock")
                MenuCell(title: "Privacy", imageName: "person.circle")
                MenuCell(title: "Help", imageName: "questionmark.circle")
                MenuCell(title: "About", imageName: "info.circle")
                
                Button {
                    showLogoutAlert.toggle()
                } label: {
                    Text("Log Out")
                        .modifier(LuminoteButton1Modifier())
                }
            }
            .alert("Logout of your account?", isPresented: $showLogoutAlert) {
                Button("Logout") {
                    AuthService.shared.signOut()
                }
                Button("Cancel", role: .cancel) {}
            }
            .background(Color(.systemGray6))
            .scrollIndicators(.hidden)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Text("Settings")
                        .font(.title)
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
