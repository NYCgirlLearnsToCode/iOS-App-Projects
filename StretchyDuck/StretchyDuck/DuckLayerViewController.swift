//
//  ViewController.swift
//  StretchyDuck
//
//  Created by Lisa J on 1/9/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class DuckLayerViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var animateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    static func storyBoardInstance() -> DuckLayerViewController {
        let storyBoard = UIStoryboard(name: "DuckLayer", bundle: nil)
        let duckLayerViewController = storyBoard.instantiateViewController(withIdentifier: "DuckLayerViewController") as! DuckLayerViewController
        return duckLayerViewController
    }
    
    @IBAction func animate(button: UIButton) {
        animateDuck()
    }
    
    func animateDuck() {
        let animation = CABasicAnimation(keyPath: "transform")
        let fromValue = CATransform3DMakeScale(2, 0.5, 1)
        let toValue = CATransform3DMakeScale(1, 1, 1)
        animation.fromValue = fromValue
        animation.toValue = toValue
        //animation.repeatCount = Float.infinity
        animation.duration = 1.0
        animation.beginTime = 0.0
        //imageView.layer.add(animation, forKey: nil)
        //TODO: Stretch the duck
        let animation2 = CABasicAnimation(keyPath: "transform")
        let fromValue2 = CATransform3DMakeScale(1, 1, 1)
        let toValue2 = CATransform3DMakeScale(0.5, 1.75, 1)
        animation2.fromValue = fromValue2
        animation2.toValue = toValue2
        //animation2.repeatCount = Float.infinity
        animation2.duration = 1.0
        animation2.beginTime = 1.0
//        imageView.layer.add(animation2, forKey: nil)
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animation, animation2]
        groupAnimation.duration = 2.0
        groupAnimation.repeatCount = Float.infinity
        imageView.layer.add(groupAnimation, forKey: nil)
        
        let colorBackgroundKeyframeAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
        colorBackgroundKeyframeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        colorBackgroundKeyframeAnimation.values = [UIColor.red.cgColor,
                                                   UIColor.green.cgColor,
                                                   UIColor.blue.cgColor]
        colorBackgroundKeyframeAnimation.keyTimes = [0, 0.5, 1]
        colorBackgroundKeyframeAnimation.duration = 2
        colorBackgroundKeyframeAnimation.repeatCount = Float.infinity
        view.layer.add(colorBackgroundKeyframeAnimation, forKey: nil)
    }
}

