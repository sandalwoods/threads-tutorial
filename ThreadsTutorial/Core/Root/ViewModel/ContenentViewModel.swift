//
//  ContenentViewModel.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/22.
//

import Foundation
import Combine
import FirebaseAuth


class ContenentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
