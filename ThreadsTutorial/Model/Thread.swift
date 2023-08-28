//
//  THread.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/23.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    let ownerId: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var user: User?
    var didLiked: Bool?
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
}
