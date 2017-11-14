//
//  SegmentedControlViewController.swift
//  LifecycleMethodsAndControls
//
//  Created by Lisa J on 11/7/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit
class SegmentedControlViewController: UIViewController {
    var currentSegmentIndex: Int = 1 {
        didSet {
            self.textLabel.text = "The " + self.segmentedControl.titleForSegment(at: currentSegmentIndex)! + " segment is selected"
        }
    }
    
    override func viewDidLoad() {
        self.currentSegmentIndex = segmentedControl.selectedSegmentIndex
    }
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        self.currentSegmentIndex = sender.selectedSegmentIndex
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
    

