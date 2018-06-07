//
//  ViewController.swift
//  LoadingRandomUserImages
//
//  Created by Lisa J on 11/28/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    var users = [ResultsWrapper](){
        didSet{
            self.tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
//    {
//        willSet {
//            print(newValue)
//        }
//    }
//if you want to check if json was parsed properly
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func loadData() {
        let urlStr = "https://randomuser.me/api/?page=1&nat=us&results=10"
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
extension UsersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "User cell", for: indexPath)
        cell.textLabel?.text = "\(user.name.first.capitalized) \(user.name.last.capitalized)"
        cell.detailTextLabel?.text = user.location.state.capitalized
        return cell
    }
}
