//
//  PostsTableViewController.swift
//  NumberFactsCoreData
//
//  Created by Lisa J on 2/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    
    var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPosts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadPosts()
    }
    
    func loadPosts() {
        if let passedInUser = user {
            let userPosts = passedInUser.posts?.allObjects as! [Post]
            posts = userPosts
            return
        }
        do {
            let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            posts = try moc.fetch(Post.fetchRequest())
        }
        catch {
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = "\(post.user?.name ?? "Unknown") - \(post.title ?? "No title")"
        cell.detailTextLabel?.text = "\(post.number)"
        return cell
    }
}
