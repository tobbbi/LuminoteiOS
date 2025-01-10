//
//  User.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 09.01.25.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
