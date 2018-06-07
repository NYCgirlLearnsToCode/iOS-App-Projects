//
//  SpotifyToken.swift
//  SpotifyLogin
//
//  Created by Lisa J on 2/13/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct SpotifyToken: Codable {
    let access_token: String
    let token_type: String
    let expires_in: Int
    let refresh_token: String
    let scope: String
}
