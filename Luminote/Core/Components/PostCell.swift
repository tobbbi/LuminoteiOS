//
//  PostCell.swift
//  Luminote
//
//  Created by Tobias Knoeppel on 07.01.25.
//

import SwiftUI

struct PostCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: post.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(post.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(post.timestamp.dateValue().relativeTimestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text(post.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Text("\(post.energyLevel)")
                            .font(.footnote)
                            .padding(4)
                            .background(Color.yellow.opacity(0.7))
                            .cornerRadius(6)
                        
                        if let imageUrl = post.photo {
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 150)
                                    .cornerRadius(8)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    
                    HStack {
                        Text(post.location ?? "")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        
                        Spacer()
                        
                        HStack {
                            Text(post.timestamp.dateValue().relativeTimestampString())
                                .font(.caption)
                                .foregroundColor(Color(.systemGray3))
                        }
                    }
                    .padding(.vertical, 8)
                    
                    HStack {
                        Text("Visibility: \(post.visibility)")
                            .font(.caption)
                            .foregroundColor(Color(.blue))
                        Spacer()
                    }
                    .padding(.top, 8)
                    
                }
            }
            
            Divider()
        }
        .padding()
    }
}



struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: dev.post)
    }
}
