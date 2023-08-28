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
        Task {
            try await checkIfLiked()
            try await getLikesCount()
        }
    }
    
    var likeString: String {
        if thread.likes == 0 || thread.likes < 0 {
            return ""
        } else if thread.likes == 1 {
            return "\(thread.likes) like"
        } else {
            return "\(thread.likes) likes"
        }
    }
    
    func like() async throws {
        try await ThreadService.likeThread(threadId: thread.id)
        self.thread.didLiked = true
        self.thread.likes += 1
    }
    
    func unlike() async throws {
        try await ThreadService.unlikeThread(threadId: thread.id)
        self.thread.didLiked = false
        self.thread.likes -= 1
    }
    
    func checkIfLiked() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        self.thread.didLiked = try await Firestore.firestore().collection("users").document(uid).collection("user-likes").document(thread.id).getDocument().exists
    }
    
    func getLikesCount() async throws {
        self.thread.likes = try await Firestore.firestore().collection("threads").document(thread.id).collection("thread-likes").getDocuments().count
    }
}
