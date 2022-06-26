//
//  ProfileViewModelAsyncAwait.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/25/22.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    
    var current: User? {
        AuthViewModel.shared.user
    }
    
    var currentUID: String {
        current?.id ?? ""
    }
    
    var followedUID: String {
        user.id ?? ""
    }
    
    init(user: User) {
        self.user = user
        checkIfFollowed()
    }
    
    func follow() {
        Task {
            try await UserServiceAsyncAwait.follow(followedUID, by: currentUID)
        }
        self.user.isFollowed = true
    }
    
    func unfollow() {
        Task {
            try await UserServiceAsyncAwait.unfollow(followedUID, by: currentUID)
        }
        self.user.isFollowed = false
    }
    
    func checkIfFollowed() {
        guard !user.isCurrent else { return }
        Task {
            self.user.isFollowed = try await UserServiceAsyncAwait.checkIfFollowed(followedUID, by: currentUID)
        }
    }
}
