//
//  ViewController.swift
//  ColorChanging WithMVC
//
//  Created by Lisa J on 10/17/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var color: UILabel!
    
    @IBOutlet weak var colorView: UIView!
    
     var colorModel = ColorChangingModel()
   ran
    @IBAction func nextColorPressed(_ sender: UIButton) {
        let (newColor, newName) = colorModel.getNextColor()
        setLabelAndView(newName: newName, newColor: newColor)
    }
    
    
    @IBAction func randomColorPressed(_ sender: UIButton) {
        let (newColor, newName) = colorModel.getRandomColor()
        setLabelAndView(newName: newName, newColor: newColor)
}
    func setLabelAndView(newName: String, newColor: UIColor) {
        self.colorView.backgroundColor = newColor
        self.color.text = newName
    }
}

