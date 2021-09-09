//
//  ContentView.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/7/21.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        VStack {
            Text("Reddit Feed")
                .font(.system(size: 22).bold())
            List {
                ForEach(viewModel.feedPosts) { post in
                    PostView(post: post)
                        .padding([.bottom])
                        .onAppear(perform: {
                            if viewModel.shouldLoadMorePosts(post) {
                                viewModel.getPostsAfterAnchor(anchor: post.name)
                            }
                        })
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
