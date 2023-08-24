//
//  CreateThreadViewModel.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/23.
//

import Firebase

class CreateThreadViewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    func fetchThreads() {
        
    }
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerId: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
