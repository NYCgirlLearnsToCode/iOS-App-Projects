//
//  LoginViewController.swift
//  InstaPics
//
//  Created by Lisa J on 2/13/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    
    private let scheme = "InstaPics://"
    private var authSession: SFAuthenticationSession?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // retrieve code from callbackURL
    private func getParam(url: URL, param: String) -> String? {
        guard let urlComponents = URLComponents(string: url.absoluteString) else { print("url is nil");return nil }
        return urlComponents.queryItems?.first{ $0.name == param }?.value
    }
    
    @IBAction func loginWithInstagram(_ sender: UIButton) {
        authSession = SFAuthenticationSession.init(url: URL(string:InstagramKeys.authURL)!, callbackURLScheme: scheme) { (callbackURL, error) in
            if let error = error {
                print("loginWithInstagram error: \(error)")
            } else if let callbackURL = callbackURL {
                print("callbackURL: \(callbackURL)")
                guard let code = self.getParam(url: callbackURL, param: "code") else { print("need a valid code"); return }
                print("code: \(code)")
                //self.tokenExchange(code: code)
            }
        }
        authSession?.start()
    }
    
    
    
}
