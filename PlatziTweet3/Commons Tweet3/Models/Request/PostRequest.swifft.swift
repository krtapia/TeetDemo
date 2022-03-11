//
//  PostRequest.swifft.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 27/01/22.
//

import Foundation

struct PostRequest: Codable {
    let text: String
    let imageUrl: String?
    let videoUrel: String?
    let location: PostRequestLocation? 
}
