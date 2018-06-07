//
//  NetworkSession.swift
//  SpotifyLogin
//
//  Created by Lisa J on 2/13/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

class NetworkSession {
    private init(){}
    static let shared = NetworkSession()
    static let urlSession = URLSession(configuration: .default)
}
