//
//  ViewController.swift
//  SocialFeedTest
//
//  Created by Lisa J on 1/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    let feeds = ["post 1", "post 2"]
    let feedView = FeedPostsTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedView.tableView.dataSource = self
        view.addSubview(feedView)
        configureNavBar()
    }
    
    private func configureNavBar() {
        self.navigationController?.navigationBar.barTintColor = .red
        self.navigationItem.title = "Feed"
        let addBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPostButton))
        navigationItem.rightBarButtonItem = addBarItem
    
    }
    
    @objc private func addPostButton() {
        //TODO: segue to NewPostViewController
    }


}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feed = feeds[indexPath.row]
        let cell = feedView.tableView.dequeueReusableCell(withIdentifier: "postTableViewCell", for: indexPath)
        cell.textLabel?.text = feed
        return cell
    }
    
    
}
