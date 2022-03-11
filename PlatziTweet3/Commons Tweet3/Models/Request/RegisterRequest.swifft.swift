//
//  RegisterRequest.swifft.swift
//  PlatziTweet3
//
//  Created by Carlos Tapia  on 27/01/22.
//

import Foundation

struct RegisterRequest: Codable {
    let email: String
    let password: String
    let name: String
}
