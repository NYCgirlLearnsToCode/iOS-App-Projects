//
//  ViewController.swift
//  animations
//
//  Created by Lisa J on 1/8/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var originalPosition: CGRect = .zero
    var originalBounds: CGRect = .zero
    let rotate = CGAffineTransform(rotationAngle: 600)
    let rotateBack = CGAffineTransform(rotationAngle: -600)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        originalPosition = squareView.frame
        squareView.backgroundColor = .red
        
        
    }

    @IBOutlet weak var squareView: UIView!
    
    @IBOutlet weak var animateButton: UIButton!
    @IBAction func animateButtonPressed(_ sender: Any) {
        animateButton.isEnabled = false
        var finalPosition = CGRect()
        if squareView.frame == originalPosition {
            finalPosition = originalPosition.offsetBy(dx: 0, dy: -(self.view.frame.height * 0.3))
            //finalPosition = view.safeAreaLayoutGuide.layoutFrame
            print(originalPosition)
        }
        else {
//finalPosition = originalPosition
            squareView.backgroundColor = .blue
            self.squareView.frame = originalPosition
            print("else\(self.squareView.frame)")
            //squareView.transform = rotateBack
            //self.squareView.layer.cornerRadius = 0
        }
        UIView.animate(withDuration: 3.0, animations: {
            if self.squareView.frame != self.originalPosition {
            self.squareView.layer.cornerRadius = 0
            self.squareView.frame = self.originalPosition
            self.squareView.transform = self.rotateBack
                //self.squareView.bounds = self.originalBounds
                //self.squareView.transform = self.rotate
                print("in")
                return
            }
            self.squareView.frame = finalPosition
            self.squareView.backgroundColor = .green
            self.squareView.layer.cornerRadius = self.squareView.bounds.width
            self.squareView.transform = self.rotate
            
        }) { (success) in
            self.animateButton.isEnabled = true
            print("completion success")
        }
    }
}






