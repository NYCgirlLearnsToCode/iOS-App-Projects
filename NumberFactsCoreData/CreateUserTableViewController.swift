//
//  CreateUsersTableViewController.swift
//  NumberFactsCoreData
//
//  Created by Lisa J on 2/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class CreateUserTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        //TO DO: Validate name
        let newUserName = nameTextField.text!
        let newUserDOB = datePicker.date
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //create new user
        let newUser = User(name: newUserName, dob: newUserDOB)
        let successAlert = UIAlertController(title: "Success", message: "New user added", preferredStyle: .alert)
        successAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(successAlert, animated: true, completion: nil)
    }
}
