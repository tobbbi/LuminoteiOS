//
//  Post.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 10.01.25.
//

import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Codable {
    @DocumentID var postId: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return postId ?? NSUUID().uuidString
    }
    
    var user: User?
}

