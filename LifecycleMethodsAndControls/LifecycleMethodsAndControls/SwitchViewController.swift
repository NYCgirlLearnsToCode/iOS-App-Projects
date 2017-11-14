//
//  SwitchViewController.swift
//  LifecycleMethodsAndControls
//
//  Created by Lisa J on 11/7/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class SwitchViewController: UIViewController {
    var switchIsOn: Bool = true {//prop observer
        didSet {
            switchLabel.text = "The switch is " + (switchIsOn ? "on" : "off")
        }
    }
    
    @IBOutlet weak var simpleSwitch: UISwitch!
    
    @IBOutlet weak var switchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchIsOn = simpleSwitch.isOn//makes sure it's set to initial val
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        self.switchIsOn = sender.isOn //property observer
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
