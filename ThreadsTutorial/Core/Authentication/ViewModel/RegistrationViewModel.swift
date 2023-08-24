//
//  RegistrationViewModel.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/22.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(withEmail: email, password: password, fullname: fullname, username: username)
    }
}
