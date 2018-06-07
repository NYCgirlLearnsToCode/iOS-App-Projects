//
//  EditListViewController.swift
//  DSA
//
//  Created by Lisa J on 12/12/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class EditListViewController: UIViewController {
    @IBOutlet weak var DSATextField: UITextField!
    
    @IBOutlet weak var DSATextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        guard let dsaTitle = DSATextField.text,
            let dsaDescription = DSATextView.text else {return}
        if dsaTitle.isEmpty || dsaDescription.isEmpty {
            showAlert()
            return
        }else {//save
            let dsaItem = DSA.init(title: dsaTitle, description: dsaDescription)
            DataModel.shared.addDSAItemToList(dsaItem:dsaItem)
        }
        navigationController?.dismiss(animated: true, completion: nil)
        
    }
    private func showAlert() {
        let alertController = UIAlertController(title:"Missing Fields", message: "Title and Description are required", preferredStyle: .alert)
        let okAlert = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAlert)
        present(alertController, animated: true, completion: nil)
    }
}
