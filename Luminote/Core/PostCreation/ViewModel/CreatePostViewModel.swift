//
//  CreatePostViewModel.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 10.01.25.
//

import Firebase

class CreatePostViewModel: ObservableObject {
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let post = Post(ownerUid:uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await PostService.uploadPost(post)
    }
}

