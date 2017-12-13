//
//  ViewController.swift
//  LoadingRandomUserImages
//
//  Created by Lisa J on 11/28/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var users = [ResultsWrapper]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func loadData() {
        let urlStr = "https://randomuser.me/api/?results=5&inc=name,gender,dob,cell,location,picture&noinfo"
        let completion : ([ResultsWrapper]) -> Void = {(onlineUsers: [ResultsWrapper]) in
            self.users = onlineUsers
        }
        let errorHandler: (AppError) -> Void = {(error: AppError) in
            switch error {
            case .couldNotParseJSON(let error):
                    print(error)
            case .noInternetConnection:
                print("no internet connection")
            default:
                print("\(error) + other error")
            }
            
        }
        UserAPIClient.manager.getUsers(from: urlStr, completionHandler: completion, errorHandler: errorHandler)
    }

}

