//
//  TasksTableViewController.swift
//  TaskList
//
//  Created by Lisa J on 1/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {

    var tasks = [Task]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        FirebaseAPIClient.manager.loadAllTasks{(tasks, error) in
            if let error = error {print(error); return}
            guard let onlineTasks = tasks else { return }
            self.tasks = onlineTasks
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        let task = tasks[indexPath.row]
        let display = "status : \(task.name), status:\(task.status), Estimated Time:\(task.estimatedTime)"
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = display
        return cell
    }
 
}
