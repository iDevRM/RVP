//
//  PostView.swift
//  Reddit Feed
//
//  Created by Rick Martinez on 9/9/21.
//

import SwiftUI

struct PostView: View {
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

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(id: UUID(), score: 283, imageURL: "https://b.thumbs.redditmedia.com/fw2k8hGdMgykuR04gHVWw7T72vupCu6-abOtDXpfLwU.jpg", title: "Test", commentCount: 85, imageWidth: 140, imageHeight: 100, name: "jhfba"))
    }
}
