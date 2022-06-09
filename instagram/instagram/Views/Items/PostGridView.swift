//
//  PostGridView.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/8/22.
//

import SwiftUI

struct PostGridView: View {
    var posts = Users.all.flatMap { user in
        user.posts
    }
    private let items = [GridItem(), GridItem(), GridItem()]
    
    var body: some View {
        LazyVGrid(columns: items, spacing: screen.minDim / 20) {
            ForEach(posts) { post in
                NavigationLink {
                    FeedView()
                } label: {
                    Labels.postGridLabel(for: post, withScaling: 3)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
