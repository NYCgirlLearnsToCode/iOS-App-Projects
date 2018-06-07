//
//  EnemyBaseVC.swift
//  Delegation
//
//  Created by Lisa J on 2/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

protocol SpyDelegate {
    func didFindWeaponsOfMassDestruction(found: Bool)
}

class EnemyBaseVC: UIViewController {

    let hasWeaponOfMassDestruction: Bool = true
    var delegate: SpyDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendingMessage(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didFindWeaponsOfMassDestruction(found: hasWeaponOfMassDestruction)
            dismiss(animated: true, completion: nil)
        }
    }
    

}
