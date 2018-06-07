//
//  LoginViewController.swift
//  JobMktPlace
//
//  Created by Lisa J on 2/1/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var signInButton: UIButton!
    private var authUserService = AuthUserService()
    private var isNewUser = false
    override func viewDidLoad() {
        super.viewDidLoad()
        authUserService.delegate = self
        // Do any additional setup after loading the view.
    }

    public static func storyboardInstance() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        return loginViewController
    }
    
    // either creates new user or sign existing user
    @IBAction private func authActionButtonPressed() {
        guard let emailText = emailTextField.text else {print("email is nil");return}
        guard !emailText.isEmpty else {print("email is empty");return}
        guard let passwordText = passwordTextField.text else {print("password is nil"); return}
        guard !passwordText.isEmpty else {print("password is empty"); return}
//        authUserService.createUser(email: emailText, password: passwordText)
        if isNewUser {
                authUserService.createUser(email: emailText, password: passwordText)
        } else {
                authUserService.signIn(email: emailText, password: passwordText)
        }
    }
    
    //updates UI for the login screen
    @IBAction func toggleAuthentication(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else {return}
        if buttonTitle == "sign in" {
            signInButton.setTitle("sign up", for: .normal)
            submitButton.setTitle("create account", for: .normal)
        } else {
            signInButton.setTitle("sign in", for: .normal)
            submitButton.setTitle("log in", for: .normal)
            isNewUser = false
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
        
    }
}

extension LoginViewController: AuthUserServiceDelegate {
    func didCreateUser(_ userService: AuthUserService, user: User) {
        print("didCreateUser: \(user)")
        let tabController = TabBarController.storyboardInstance()
        present(tabController, animated: true, completion: nil)
    }
    
    func didFailCreatingUser(_ userService: AuthUserService, error: Error) {
        showAlert(title: "Error creating User", message: error.localizedDescription)
    }
    func didSignIn(_ userService: AuthUserService, user: User) {
        let tabController = TabBarController.storyboardInstance()
        present(tabController, animated: true, completion: nil)
    }
    func didFailSignIn(_ userService: AuthUserService, error: Error) {
        showAlert(title: "Error signing in User", message: error.localizedDescription)
    }
}
