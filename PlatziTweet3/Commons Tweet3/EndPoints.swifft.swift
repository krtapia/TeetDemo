//
//  EndPoints.swifft.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 27/01/22.
//

import Foundation

struct Endpoints{
    static let domain = "https://platzi-tweets-backend.herokuapp.com/api/v1"
    static let login = Endpoints.domain + "/auth"
    static let register = Endpoints.domain + "/register"
    static let getPost = Endpoints.domain + "/posts"
    static let post = Endpoints.domain + "/posts"
    static let delete = Endpoints.domain + "/posts/"
    
    
}
