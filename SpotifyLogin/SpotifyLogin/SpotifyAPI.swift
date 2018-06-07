//
//  SpotifyAPI.swift
//  SpotifyLogin
//
//  Created by Lisa J on 2/13/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

class SpotifyAPI {
    public func tokenExchange(code: String) {
        var urlRequest = URLRequest(url: URL(string: "\(SpotifyKeys.tokenExchangeURL)")!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = "\(SpotifyKeys.httpBody)\(code)".data(using: .utf8)
        print()
        print("\(SpotifyKeys.httpBody)\(code)")
        print()
        NetworkSession.urlSession.dataTask(with: urlRequest){(data, response, error) in
            if let error = error {
                print("tokenExchange error: \(error)")
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let token = try decoder.decode(SpotifyToken.self, from: data)
                    print("token: \(token.access_token)")
                    //TODO: save to user defaults
                } catch {
                    print("tokenExchange decoding error: \(error)")
                }
            }
        }.resume()
    }
}
