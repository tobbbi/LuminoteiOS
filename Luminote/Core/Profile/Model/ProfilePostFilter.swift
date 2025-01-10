//
//  ProfilePostFilter.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 08.01.25.
//

import Foundation

enum ProfilePostFilter: Int, CaseIterable, Identifiable {
    case posts
    case replies
    // here I can add as many as I wish 1:08:20
    var title: String {
        switch self {
        case .posts: return "Posts"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
