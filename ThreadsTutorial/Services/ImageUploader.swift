//
//  ImageUploader.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/23.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUpLoader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil}
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        do {
            let _ = storageRef.putData(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch  {
            print("DEBUG: Failed to upload image: \(error.localizedDescription)")
            return nil
        }
    }
}

