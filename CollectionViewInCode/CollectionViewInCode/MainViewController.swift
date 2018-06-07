//
//  MainViewController.swift
//  CollectionViewInCode
//
//  Created by Lisa J on 1/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showCollection() {
        let collectionVC = CollectionViewController()
        navigationController?.pushViewController(collectionVC, animated: true)
    }

}
