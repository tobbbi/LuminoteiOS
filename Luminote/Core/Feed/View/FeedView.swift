//
//  FeedView.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 07.01.25.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        PostCell(post: post)
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchPosts() }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: FriendsView()) {
                        Image(systemName: "person.2")
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ActivityView()) {
                        Image(systemName: "heart")
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Image("Luminote_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.bottom, 10)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FeedView()
    }
}
