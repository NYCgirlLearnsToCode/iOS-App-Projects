//
//  JobsFeedViewController.swift
//  JobMktPlace
//
//  Created by Lisa J on 2/1/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class JobsFeedViewController: UIViewController {
    
    private var authUserService = AuthUserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        authUserService.delegate = self
    }
    
    
    private func configureNavBar() {
        navigationItem.title = "Jobs"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addJob))
    }
    

    @objc private func signOut() {
        authUserService.signOut()
    }
    
    @objc private func addJob() {
        //DBService.manager.addJob(title: "jr iOS dev needed", description: "1 yr experience reqd")
       // DBService.manager.addJob(title: "iOS intern needed", description: "6 months experience reqd")
        //DBService.manager.addJob(title: "iOS dev needed", description: "2 yr experience reqd")
        
        let addJobVC = AddJobViewController.storyboardInstance()
        addJobVC.modalTransitionStyle = .crossDissolve
        addJobVC.modalPresentationStyle = .overCurrentContext
        let navController = UINavigationController(rootViewController: addJobVC)
        present(navController, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension JobsFeedViewController: AuthUserServiceDelegate{
    func didSignOut(_ userService: AuthUserService) {
        let loginVC = LoginViewController.storyboardInstance()
        tabBarController?.tabBar.isHidden = true
        navigationController?.viewControllers = [loginVC]
    }
    func didFailSigningOut(_ userService: AuthUserService, error: Error) {
        showAlert(title: "Error Signing Out", message: error.localizedDescription)
    }
}
