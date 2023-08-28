//
//  ThreadCellViewModel.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/28.
//

import FirebaseFirestore
import FirebaseAuth

@MainActor
class ThreadCellViewModel: ObservableObject {
    
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task { try await checkIfLiked()}
    }
    
    func like() async throws {
        try await ThreadService.likeThread(threadId: thread.id)
        self.thread.didLiked = true
    }
    
    func unlike() async throws {
        try await ThreadService.unlikeThread(threadId: thread.id)
        self.thread.didLiked = false
    }
    
    func checkIfLiked() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        self.thread.didLiked = try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(thread.id).getDocument().exists
    }
}
