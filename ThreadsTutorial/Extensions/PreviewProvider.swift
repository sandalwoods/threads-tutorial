//
//  PreviewProvider.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/23.
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
    
    let MOCK_USER = User(id: NSUUID().uuidString, fullname: "mock user", email: "mock@gmail.com", username: "mock", profileImageUrl: nil, bio: nil)
    
    let MOCK_THREAD = Thread(ownerId: "123", caption: "This is mock one", timestamp: Timestamp(), likes: 3)
}
