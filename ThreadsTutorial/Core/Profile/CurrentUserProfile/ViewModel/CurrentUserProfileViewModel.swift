//
//  CurrentUserProfileViewModel.swift
//  ThreadsTutorial
//
//  Created by kevin on 2023/8/23.
//

import SwiftUI
import Combine
import PhotosUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchUserData()
    }
    
    private func fetchUserData() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
    
}
