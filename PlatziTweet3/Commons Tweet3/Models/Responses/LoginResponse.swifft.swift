//
//  LoginResponse.swifft.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia on 27/01/22.
//

import Foundation


struct LoginResponse: Codable {
    let user: String
    let token: String
}
