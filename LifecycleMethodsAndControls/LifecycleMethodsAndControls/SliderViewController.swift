//
//  SliderViewController.swift
//  LifecycleMethodsAndControls
//
//  Created by Lisa J on 11/7/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    var currentVal: Double = 0.5 {
        didSet {
            self.view.backgroundColor = UIColor(displayP3Red: 0.6, green: 0.2, blue: CGFloat(currentVal), alpha: 1)
        }
    }
    
    @IBOutlet weak var sliderLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.currentVal = Double(sender.value)
    } 
    
}
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


