//
//  PreviewProvider.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 09.01.25.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Peter Lustig", email: "peter@gmail.com", username: "peterlustig")
    
    let post = Post(ownerUid: "123", caption: "This is a test post", timestamp: Timestamp(), likes: 0)
}
