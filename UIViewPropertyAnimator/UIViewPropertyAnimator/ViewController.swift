//
//  ViewController.swift
//  UIViewPropertyAnimator
//
//  Created by Lisa J on 1/8/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var animator: UIViewPropertyAnimator!
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slider)
        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        slider.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        let box = UIView(frame: CGRect(x: -60, y: 0, width: 100, height: 100))
        view.addSubview(box)
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .yellow
        box.center.y = view.center.y
        
        animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut)
        {
                box.center.x = self.view.frame.width
                box.transform = CGAffineTransform(rotationAngle: CGFloat.pi).scaledBy(x: 0.001, y: 0.001)
        }
    }
    
    @objc func sliderChanged(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value) * 5
    }

}

