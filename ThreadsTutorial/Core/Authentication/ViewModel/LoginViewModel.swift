//
//  LoginViewModel.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/23.
//

import Foundation


class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
