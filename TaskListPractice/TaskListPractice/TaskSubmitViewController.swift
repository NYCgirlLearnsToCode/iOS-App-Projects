//
//  TaskSubmitViewController.swift
//  TaskListPractice
//
//  Created by Lisa J on 1/30/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import FirebaseDatabase

class TaskSubmitViewController: UIViewController {
  
    var ref: DatabaseReference!
    var ref2 :DatabaseReference!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    
    @IBOutlet weak var newTaskTextField: UITextField!
    @IBOutlet weak var newStatusTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]() {
        didSet {
            tableView.reloadData()
        }
    }
    var newTasks = [Task](){
        didSet{
            print(newTasks)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        //this will make the reference if it doesn't exist
        ref = Database.database().reference().child("tasklistpractice")
        ref2 = Database.database().reference().child("new")
        //this will repopulate and refresh the tableview
        ref.observe(DataEventType.value){(snapshot) in
            if snapshot.childrenCount > 0 {
                self.tasks.removeAll()
            }
            //this loop turns the dict into an array of the custom object
            for tasks in snapshot.children.allObjects as! [DataSnapshot] {
                //bc dict values can be anything, you have to state what it will be
                let taskObject = tasks.value as? [String: AnyObject]
                let taskName = taskObject?["name"] as! String
                let taskStatus = taskObject?["status"] as! String
                //you create and substantiate the object here
                let task = Task(name: taskName, status: taskStatus)
                self.tasks.append(task)
            }
            self.ref2.observe(DataEventType.value){(snapshot) in
                if snapshot.childrenCount > 0 {
                    self.newTasks.removeAll()
                }
                //this loop turns the dict into an array of the custom object
                for newTask in snapshot.children.allObjects as! [DataSnapshot] {
                    //bc dict values can be anything, you have to state what it will be
                    let taskObject = newTask.value as? [String: AnyObject]
                    let taskName = taskObject?["name"] as! String
                    let taskStatus = taskObject?["status"] as! String
                    //you create and substantiate the object here
                    let newTask = Task(name: taskName, status: taskStatus)
                    self.newTasks.append(newTask)
                }
            }
            self.tableView.reloadData()
        }
        //loadData()
    }
    
    private func addTask() {
        let key = ref.child("tasklistpractice").childByAutoId().key
        let task = ["id" : key, "name" : taskTextField.text! as String, "status": statusTextField.text! as String]
        ref.child(key).setValue(task)
        responseLabel.text = "Task added"
    }
    
    private func addNewTask() {
        let key = ref2.child("new").childByAutoId().key
        let newTask = ["id" : key, "name" : newTaskTextField.text! as String, "status": newStatusTextField.text! as String]
        ref.child(key).setValue(newTask)
        print("new task added")
    }
    
//    private func loadData() {
//        FirebaseAPIClient.manager.loadTasks{(tasks, error) in
//            if let error = error {print(error); return}
//            guard let onlineTasks = tasks else {return}
//            self.tasks = onlineTasks
//            print(tasks!)
//        }
//    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        print("submit button pressed")
        //textfields are never nil, if nothing then will be empty strings
        guard taskTextField.text != "" else {return}
        guard statusTextField.text != "" else {return}
        addTask()
    }
    @IBAction func newTaskButtonSubmitted(_ sender: UIButton) {
        guard newTaskTextField.text != "" else {return}
        guard newStatusTextField.text != "" else {return}
        addNewTask()
    }
    
    
}
extension TaskSubmitViewController: UITableViewDataSource {
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Task Cell", for: indexPath)
        cell.textLabel?.text = task.name
        print(task.name)
        cell.detailTextLabel?.text = task.status
        return cell
    }
}


