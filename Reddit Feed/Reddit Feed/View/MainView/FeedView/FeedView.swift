//
//  FeedView.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 6/16/22.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        VStack {
            Text("Reddit Feed")
                .font(.system(size: 22).bold())
            List {
                ForEach(viewModel.postFeed) { post in
                    PostView(post: post)
                        .padding(.bottom)
                        .onAppear(perform: {
                            if viewModel.postIsAnchor(post) {
                                viewModel.getPostsAfter(anchor: post.name)
                            }
                        })
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
