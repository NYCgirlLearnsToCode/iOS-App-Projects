//
//  ViewController.swift
//  TaskList
//
//  Created by Lisa J on 1/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let (email, pass) = getUserNameAndPass()
        FirebaseAPIClient.manager.login(with: email, and: pass){(user, error) in
            if let error = error {
                print(error)
                return
            }
            if let user = user {
                self.performSegue(withIdentifier: "SegueFromLogin", sender: self)
            }
        }
    }
    @IBAction func createNewAccountButtonPressed(_ sender: UIButton) {
        let (email, pass) = getUserNameAndPass()
        FirebaseAPIClient.manager.createAccount(with: email, and: pass){(user, error) in
            guard error == nil else {print(error); return}
            guard let user = user else {print("no user"); return }
            self.performSegue(withIdentifier: "SegueFromLogin", sender: self)
            print("New account for \(user) created")
        }
        //Create an account
    }
    @IBAction func logOutButtonPressed(_ sender: UIButton) {
        FirebaseAPIClient.manager.logOutCurrentUser()
    }
    
    func getUserNameAndPass() -> (String, String) {
        //TODO: validate name & pass and check for nil
        let name = emailTextField.text
        let pass = passwordTextField.text
        return (name!,pass!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

