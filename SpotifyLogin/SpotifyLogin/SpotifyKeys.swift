//
//  SpotifyKeys.swift
//  SpotifyLogin
//
//  Created by Lisa J on 2/13/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct SpotifyKeys {
    private static let clientId = "f1de1d99c4de4f049c89ebe1ce2c1f77"
    private static let clientSecret = "fe049dddab39419aae82c7bc81ebdbbb"
    private static let redirectURI = "SpotifyLogin://"// the pg the user will be redirected to with auth code attached (uri - uniform resource identifier)
    private static let state = "234567834"
    private static let scope = ""
   
    public static let authURL = "https://accounts.spotify.com/authorize/?client_id=\(SpotifyKeys.clientId)&response_type=code&redirect_uri=\(SpotifyKeys.redirectURI)&state=\(SpotifyKeys.state)"
    public static let tokenExchangeURL = "https://accounts.spotify.com/api/token?"
    //reqd params for making POST request for token exchange
    //grant_type
    //redirect_uri
    //code - recieved from initial auth request
    public static let httpBody = "grant_type=authorization_code&redirect_uri=\(SpotifyKeys.redirectURI)&client_id=\(SpotifyKeys.clientId)&client_secret=\(SpotifyKeys.clientSecret)&code="
}
