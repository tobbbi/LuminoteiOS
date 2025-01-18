//
//  LuminoteTabView.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 07.01.25.
//

import SwiftUI

struct LuminoteTabView: View {
    @State private var selectedTab = 0
    @State private var showCreatePostView = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear{ selectedTab = 0 }
                .tag(0)
            
            Text("") // Empty tab to maintain the original layout space
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear{ selectedTab = 1 }
                .tag(1)
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                }
                .onAppear{ selectedTab = 2 }
                .tag(2)
        }
        .onChange(of: selectedTab, perform: {newValue in
            showCreatePostView = selectedTab == 1
        })
        .sheet(isPresented: $showCreatePostView, onDismiss: {
            selectedTab = 0 // to remember the tab that was opened before clicking "+ create post", the logic can be implemented here
        }, content: {
            CreatePostView()
        })
        .tint(.black)
    }
}


#Preview {
    LuminoteTabView()
}
