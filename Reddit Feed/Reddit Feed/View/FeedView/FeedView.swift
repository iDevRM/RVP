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
                ForEach(viewModel.feedPosts.indices, id: \.self) { index in
                    PostView(post: viewModel.feedPosts[index])
                }.onAppear(perform: {
                    print("Cell Appeared")
                })
                .padding([.top])
            }
            .padding([.bottom])
            .onAppear(perform: {
                viewModel.getPosts()
            })
        }
        .environmentObject(viewModel)
    }
    
}

struct PostView: View {
    @EnvironmentObject private var viewModel: FeedViewModel
    var post: Post
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.system(size: 18).bold())
                .padding([.leading])
                .lineLimit(10)
            if post.imageURL.contains("http") {
                Image(uiImage: post.imageURL.load())
                    .resizable()
                    .scaledToFit()
            }
            
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
            
        }
        
    }
   
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
