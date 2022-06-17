//
//  ProfileHeader.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct ProfileHeader: View {
    var user: User
    
    var body: some View {
        HStack {
            Labels.profileImage(for: user)
            Spacer()
            UserStatView(stat: .posts, count: user.postCount)
            Spacer()
            UserStatView(stat: .followers, count: user.followers)
            Spacer()
            UserStatView(stat: .following, count: user.following)
        }
    }
}
