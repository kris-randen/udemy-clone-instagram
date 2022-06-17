//
//  Stories.swift
//  instagram
//
//  Created by Krishnaswami Rajendren on 6/17/22.
//

import SwiftUI

struct Stories: View {
    var user: User
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(user.stories) { story in
                    StoryView(post: story)
                }
            }
        }
        .frame(maxWidth: screen.width, maxHeight: screen.minDim / 3.5)
        .profileBottomPaddify()
    }
}
