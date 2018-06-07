//
//  FirebaseAPIClient.swift
//  TaskListPractice
//
//  Created by Lisa J on 1/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class FirebaseAPIClient {
    static let manager = FirebaseAPIClient()
    private init() {}
    func createNewAccount(with email: String, and password: String, completion: @escaping (User?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    func loginToAccount(with email: String, and password: String, completion: @escaping (User?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    func loadTasks(completionHandler: @escaping ([Task]?, Error?) -> Void) {
        let ref = Database.database().reference().child("tasklistpractice")
        ref.observe(.value){(snapShot) in
            guard let snapShots = snapShot.children.allObjects as? [DataSnapshot] else {return}
            var allTasks = [Task]()
            for snap in snapShots {
                let taskName = snap.key
                if let taskStatus = snap.value as? String {
                    let task = Task(name: taskName, status: taskStatus)
                    allTasks.append(task)
                }
            }
            completionHandler(allTasks, nil)
        }
    }
    func createTestTasks (){
        let taskOne = Task(name: "laundry", status: "completed")
        let taskTwo = Task(name: "dishes", status: "incomplete")
        let taskThree = Task(name: "homework", status: "in progress")
        let ref = Database.database().reference().child("tasklistpractice")
        ref.childByAutoId().setValue(taskOne.toJSON())
        ref.childByAutoId().setValue(taskTwo.toJSON())
        ref.childByAutoId().setValue(taskThree.toJSON())
        
    }
    
    
}
