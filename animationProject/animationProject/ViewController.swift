//
//  ViewController.swift
//  animationProject
//
//  Created by Lisa J on 1/14/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    let containerView = UIView(
        frame: CGRect(x: 0.0, y: 0.0, width: 375.0, height: 667.0)
    )
    let duckImage = UIImageView(
        frame: CGRect(x: 100.0, y: 100.0, width: 50.0, height: 60.0)
    )
    duckImage.image = UIImage(named: )
    containerView.addSubview(duckImage)
    let circle = UIView(
        frame: CGRect(x: 0.0, y: 0.0, width: 64.0, height: 64.0)
    )
    circle.center = containerView.center
    circle.backgroundColor = UIColor.blue
    circle.layer.borderColor = UIColor.blue.cgColor
    circle.layer.cornerRadius = 32.0
    circle.layer.borderWidth = 2.0
    containerView.addSubview(circle)
    let translate =
        CGAffineTransform(translationX: -100, y: 300)
    //-x is left, x is right, -y is up, y is down
    let rotate = CGAffineTransform(rotationAngle: 100)
    let scale = CGAffineTransform(scaleX: 5, y: 5)
    
    UIView.animate(withDuration: 2.0, animations: { () -> Void in
    circle.backgroundColor = UIColor.white
    //duckImage.center = containerView.center
    circle.transform = scale
    //circle.transform = CGAffineTransform.identity
    duckImage.transform = rotate.concatenating(translate).concatenating(scale)
    })

}

