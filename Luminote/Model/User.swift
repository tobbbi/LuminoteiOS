//
//  User.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 09.01.25.
//

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?

    // Neue Eigenschaften
    var isSuggested: Bool = false
    var isFriend: Bool = false
    var hasRequested: Bool = false
}

