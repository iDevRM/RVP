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
        List {
            ForEach(viewModel.feedPosts.indices, id: \.self) { index in
                PostView(post: viewModel.feedPosts[index])
            }
        }
        .onAppear(perform: {
            viewModel.getPosts()
        })
    }
}

struct PostView: View {
    var post: Post
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.system(size: 20).bold())
                .padding([.leading])
            Rectangle()
                .frame(width: CGFloat(post.imageWidth ?? Int(UIScreen.main.bounds.width)), height: CGFloat(post.imageHeight ?? Int(UIScreen.main.bounds.height)), alignment: .center)
                .aspectRatio(1, contentMode: .fit)
            HStack {
                HStack{
                    Text("Score")
                        .foregroundColor(.black)
                        
                    Text("\(post.score)")
                }
                Spacer()
                
                HStack {
                    Image(systemName: "bubble.left")
                        .resizable()
                        .frame(width: 20, height: 20, alignment: .center)
                        .foregroundColor(.black)
                        
                    Text("\(post.commentCount)")
                }
                
                Spacer()
            }
            .padding([.leading,.trailing])
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
