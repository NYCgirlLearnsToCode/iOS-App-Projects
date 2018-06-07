//
//  ViewController.swift
//  Delegation
//
//  Created by Lisa J on 2/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class HomeBaseVC: UIViewController, SpyDelegate {
   
    func didFindWeaponsOfMassDestruction(found: Bool) {
        print("Data Received")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendSpySegue" {
            let vc: EnemyBaseVC = segue.destination as! EnemyBaseVC
            vc.delegate = self
        }
    }
}

