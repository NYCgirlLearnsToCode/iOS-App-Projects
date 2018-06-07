//
//  LoginViewController.swift
//  SpotifyLogin
//
//  Created by Lisa J on 2/13/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    //a way for 3rd party apps to access your app
    private let scheme = "SpotifyLogin://"
    //strong ref to session
    private let spotifyAPI = SpotifyAPI()
    private var authSession: SFAuthenticationSession?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func getParam(url: URL, param: String) -> String? {
        guard let urlComponents = URLComponents(string: url.absoluteString) else {print("url us nil"); return nil }
        return urlComponents.queryItems?.first {$0.name == param }?.value
    }
    //creating a session to present user with a login pg of e.g spotify login pg
    @IBAction func loginWithSpotify(_ sender: UIButton) {
        authSession = SFAuthenticationSession.init(url: URL(string:SpotifyKeys.authURL)!, callbackURLScheme: scheme) {
            (callbackURL, error) in
            if let error = error {
                print("login with spotify error: \(error)")
            } else if let  callbackURL = callbackURL {
                print("callbackURL:\(callbackURL)")
                guard let code = self.getParam(url: callbackURL, param: "code") else {print("need valid code");return}
                print("code: \(code)")
                self.spotifyAPI.tokenExchange(code: code)
            }
            
        }
        authSession?.start()
    }
    
}
