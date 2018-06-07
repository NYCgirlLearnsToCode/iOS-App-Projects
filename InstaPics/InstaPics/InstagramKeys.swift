//
//  InstagramKeys.swift
//  InstaPics
//
//  Created by Lisa J on 2/13/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

struct InstagramKeys {
    private static let clientId = "2f34694efc744ab0ad5cfcc023597f01"
    private static let clientSecret = "4d4c0bfaad51429f81f31a950033226c"
    private static let redirectURI = "https://nycgirllearnstocode.github.io"
    private static let scope = ""
    private static let state = 3456789
    
    public static let authURL =
    "https://api.instagram.com/oauth/authorize/?client_id=\(InstagramKeys.clientId)&redirect_uri=\(InstagramKeys.redirectURI)&response_type=code&state=\(InstagramKeys.state)"
    public static let tokenExchangeURL = "https://api.instagram.com/oauth/access_token"
    public static let httpBody = "grant_type=authorization_code&redirect_uri=\(InstagramKeys.redirectURI)&client_id=\(InstagramKeys.clientId)&client_secret=\(InstagramKeys.clientSecret)&code="
}
