//
//  CreateUserTableViewController.swift
//  NumberFactsCoreData
//
//  Created by Lisa J on 2/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class CreatePostTableViewController: UITableViewController {
    
    var users = [User]()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var usersPickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersPickerView.delegate = self
        usersPickerView.dataSource = self
        loadUsers()
    }
    
    func loadUsers() {
        do {
            let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            users = try managedObjectContext.fetch(User.fetchRequest())
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        //TO DO: Validate input
        let postTitle = titleTextField.text!
        let postNum = Double(numberTextField.text!)!
        let postUser = users[usersPickerView.selectedRow(inComponent: 0)]
        
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newPost = Post(context: managedObjectContext)
        newPost.title = postTitle
        newPost.number = postNum
        newPost.user = postUser
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let successAlert = UIAlertController(title: "Success", message: "New post added", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(successAlert, animated: true, completion: nil)
    }
}

extension CreatePostTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return users.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return users[row].name
    }
}

