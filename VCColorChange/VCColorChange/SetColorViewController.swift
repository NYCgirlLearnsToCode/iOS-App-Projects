//
//  SetColorViewController.swift
//  VCColorChange
//
//  Created by Lisa J on 12/21/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit
//declare protocol where u are originating the data u want to send?
protocol setColorVCDelegate: class {
    func changeBackgroundColor(color: UIColor)
    //protocol methods can't have bodies

}


class SetColorViewController: UIViewController {
    @IBOutlet weak var purpleButton: UIButton!
    
    @IBOutlet weak var blueButton: UIButton!
    //weak bc it is to avoid retaining memory cycles, it is a way to trash it when it is not needed from memory, they are strong by default
    weak var delegate: setColorVCDelegate?// weak can only be applied to class & classbound protocol types
    
    override func viewDidLoad() {
        super.viewDidLoad()
        purpleButton.layer.borderColor = UIColor.white.cgColor
        purpleButton.layer.borderWidth = 2.0
        purpleButton.layer.cornerRadius = purpleButton.frame.width/2
        //rounded corners
        blueButton.layer.borderColor = UIColor.white.cgColor
        blueButton.layer.borderWidth = 2.0
        blueButton.layer.cornerRadius = blueButton.frame.width/2
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        view.backgroundColor = sender.backgroundColor
        delegate?.changeBackgroundColor(color: sender.backgroundColor!)
    }
    
    @IBAction func dismissButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    

}
