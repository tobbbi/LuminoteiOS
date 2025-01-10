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
            .navigationTitle("Luminote")
            .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName:"arrow.counterblockwise")
                        .foregroundColor(.black)
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
