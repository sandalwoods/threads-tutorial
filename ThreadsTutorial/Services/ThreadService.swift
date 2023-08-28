//
//  ThreadService.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/23.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadService {
    
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
    
    static func fetchThreads() async throws -> [Thread] {
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timestamp", descending: true).getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
    }
    
    static func fetchUserThreads(uid: String) async throws -> [Thread] {
        
        let snapshot = try await Firestore.firestore().collection("threads").whereField("ownerId", isEqualTo: uid).getDocuments()
        
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
        
        return threads.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
    
    static func likeThread(threadId: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        try await Firestore.firestore().collection("threads").document(threadId).collection("thread-likes").document(uid).setData([:])
        try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(threadId).setData([:])
    }
    
    static func unlikeThread(threadId: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        try await Firestore.firestore().collection("threads").document(threadId).collection("thread-likes").document(uid).delete()
        try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(threadId).delete()
    }
}
