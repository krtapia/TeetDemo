//
//  Post.swifft.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 27/01/22.
//

import Foundation

struct Post: Codable {
    let id: String
    let author: User
    let imageUrl: String
    let text: String
    let videoUrl: String
    let location: PostLocation
    let hasVideo: Bool
    let hasImage: Bool
    let hasLocation: Bool
    let createdAt: String
    
}
