//
//  ViewController.swift
//  TaskListPractice
//
//  Created by Lisa J on 1/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        FirebaseAPIClient.manager.loginToAccount(with: email, and: password){(user,error) in
            if let error = error {
                print(error)
                return
            }
            if let user = user {
                //TODO: segue to next screen
                print("\(user) has logged in")
                self.performSegue(withIdentifier: "Login Segue", sender: self)
            }
        }
    }
    
    @IBAction func createNewAccButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        //FirebaseAPIClient.manager.createTestTasks()
        FirebaseAPIClient.manager.createNewAccount(with: email, and: password){(user, error) in
            guard error == nil else {print(error!); return}
            if let user = user {
                print("Created new user: \(user)")
//                self.performSegue(withIdentifier: "Login Segue", sender: self)
            }
        }
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        
    }
    
}

