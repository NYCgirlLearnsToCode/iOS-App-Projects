//
//  ViewController.swift
//  CoreAnimationApp
//
//  Created by Lisa J on 1/9/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

//Layer Properties to animate
enum PropertyKeys: String {
    case BorderColor = "Border Color"
    case BorderWidth = "Border Width"
    case CornerRadius = "Corner Radius"
    case Shadow = "Shadow"
    case Opacity = "Opacity"
    
    //3D Transforms
    case RotationX = "RotationX"
    case RotationY = "RotationY"
    case RotationZ = "RotationZ"
    case Scale = "Scale"
    case Translation = "Translation"
    case SwapImage = "Swap Image"
    //TODO: translation and contents
}

class LayerPropertyViewController: UIViewController {
    
    //data model for cells
    let properties = [PropertyKeys.BorderColor.rawValue,
                      PropertyKeys.BorderWidth.rawValue,
                      PropertyKeys.Shadow.rawValue,
                      PropertyKeys.Opacity.rawValue,
                      PropertyKeys.RotationX.rawValue,
                      PropertyKeys.CornerRadius.rawValue,
                      PropertyKeys.RotationY.rawValue,
                      PropertyKeys.RotationZ.rawValue,
                      PropertyKeys.Scale.rawValue,
                      PropertyKeys.Translation.rawValue,
                      PropertyKeys.SwapImage.rawValue]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageView: UIImageView!
    
    var currentAnimation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        defaultLayerValues()
    }
    func defaultLayerValues() {
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = 0.0
        imageView.layer.shadowOpacity = 0.0
        imageView.layer.opacity = 1
        //imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        imageView.layer.contents = UIImage(named: "kitten")?.cgImage
    }

    static func storyBoardInstance() -> LayerPropertyViewController {
        //static don't need to instantiate class to get access to it
        //here we are getting the storyboard that contains the layerPropertyViewController
        let storyBoard = UIStoryboard(name: "LayerProperty", bundle: nil)
        //bundle nil bc we are inside the app we need
        
        //get and instantiate LayerPropertyViewController
        let layerPropertyVC = storyBoard.instantiateViewController(withIdentifier: "LayerPropertyViewController") as! LayerPropertyViewController
        return layerPropertyVC
    }
    
    @IBAction func animate(button: UIButton) {
        switch currentAnimation {
        case PropertyKeys.BorderColor.rawValue:
            animateBorderColor()
        case PropertyKeys.BorderWidth.rawValue:
            animateBorderWidth()
        case PropertyKeys.Shadow.rawValue:
            animateShadow()
        case PropertyKeys.Opacity.rawValue:
            animateOpacity()
        case PropertyKeys.CornerRadius.rawValue:
            animateCornerRadius()
        case PropertyKeys.Scale.rawValue:
            animateScale()
            
        //3D transformation animations
        case PropertyKeys.RotationX.rawValue:
            animateRotationX()
        case PropertyKeys.RotationY.rawValue:
            animateRotationY()
        case PropertyKeys.RotationZ.rawValue:
            animateRotationZ()
        case PropertyKeys.Translation.rawValue:
            animateTranslation()
        case PropertyKeys.SwapImage.rawValue:
            animateSwapImage()
        default:
            break
            
        }
        
    }
    
    @IBAction func reset() {
        imageView.layer.removeAllAnimations()
        defaultLayerValues()
    }

    
    
}

extension LayerPropertyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let property = properties[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath)
        cell.textLabel?.text = property
        return cell
    }
}

extension LayerPropertyViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let property = properties[indexPath.row]
        //property is the selected row
        currentAnimation = property
    }
}

//Mark: - Animation Functions - using core animation
extension LayerPropertyViewController {
    func animateBorderColor() {
        let animation = CABasicAnimation(keyPath: "borderColor")
        //"borderColor" is the property you are animating
        animation.fromValue = UIColor.black.cgColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 3.0
        imageView.layer.add(animation, forKey: nil)
        imageView.layer.borderColor = UIColor.red.cgColor
        
        
    }
    
    func animateBorderWidth() {
        let animation = CABasicAnimation(keyPath: "borderWidth")
        animation.fromValue = 1.0
        animation.toValue = 10.0
        animation.duration = 0.5
        imageView.layer.add(animation, forKey: nil)
        imageView.layer.borderWidth = 10.0
        
    }
    
    func animateShadow() {
        //animate shadowOpacity, default opacity is 0
        let opacityAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        opacityAnimation.fromValue =  0 //minimum value
        opacityAnimation.toValue = 1// max value
        opacityAnimation.duration = 0.5
        imageView.layer.add(opacityAnimation, forKey: nil)
        //imageView.layer.opacity = 0.5
        imageView.layer.shadowOpacity = 1
        //final value
        
        //animate the shadow offset, default is CGSize.zero
        let offsetAnimation = CABasicAnimation(keyPath: "shadowOffset")
        offsetAnimation.fromValue = CGSize.zero
        offsetAnimation.toValue = CGSize(width: 5.0, height: 5.0)
        //offsetAnimation.duration = 0.5
        imageView.layer.add(offsetAnimation, forKey: nil)
        imageView.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        //final value
        
        //create group animation
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [opacityAnimation, offsetAnimation]
        groupAnimation.duration = 1.0
        imageView.layer.add(groupAnimation, forKey: nil)
    }
    
    func animateOpacity() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        let customTimingFunction = CAMediaTimingFunction(controlPoints:0.0,0.67,1.0,0.35)
        //animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.timingFunction = customTimingFunction
        animation.toValue = 0
        animation.duration = 1
        imageView.layer.add(animation, forKey: nil)
        
        //no final value since we do ot want the animation to stay
    }
    
    func animateRotationX() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.x")
        let angleRadian = CGFloat(2.0 * .pi)// 360
        //let rotation = CATransform3DMakeRotation(angleRadian, 1.0, 0.0, 0.0)
        //1.0 is rotate on x axis
        
        
        //imageView.layer.transform = CATransform3D
        animation.fromValue = 0 //degrees
        animation.byValue = angleRadian
        animation.duration = 2.0 //
        animation.repeatCount = Float.infinity
        imageView.layer.add(animation, forKey: nil)
    }
    
    func animateCornerRadius() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = 0.0
        animation.toValue = 20
        animation.duration = 1.0
        imageView.layer.add(animation, forKey: nil)
        imageView.layer.cornerRadius = 20
    }
    
    func animateRotationY() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.y")
        let angleRadian = CGFloat(2.0 * .pi)// 360
        //let rotation = CATransform3DMakeRotation(angleRadian, 1.0, 0.0, 0.0)
        //1.0 is rotate on x axis
        
        
        //imageView.layer.transform = CATransform3D
        animation.fromValue = 0 //degrees
        animation.byValue = angleRadian
        animation.duration = 2.0 //
        animation.repeatCount = Float.infinity
        imageView.layer.add(animation, forKey: nil)
    }
    
    func animateRotationZ() {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        let angleRadian = CGFloat(2.0 * .pi)// 360
        //let rotation = CATransform3DMakeRotation(angleRadian, 1.0, 0.0, 0.0)
        //1.0 is rotate on x axis
        
        
        //imageView.layer.transform = CATransform3D
        animation.fromValue = 0 //degrees
        animation.byValue = angleRadian
        animation.duration = 2.0 //
        animation.repeatCount = Float.infinity
        imageView.layer.add(animation, forKey: nil)
    }
    
    func animateScale() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        let fromValue = CATransform3DMakeScale(1, 1, 0)
        let toValue = CATransform3DMakeScale(1.2, 1.2, 0)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.repeatCount = Float.infinity
        animation.duration = 3.0
        imageView.layer.add(animation, forKey: nil)
        
    }
    
    func animateTranslation() {
        //not sure how to translate with this method
        let fromValue = CATransform3DMakeTranslation(1, 1, 0)
        let toValue = CATransform3DMakeTranslation( 200, 200, 0)
        let animation = CABasicAnimation(keyPath: "transform.translation")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 2.0
        imageView.layer.add(animation, forKey: nil)
    }
    
    func animateSwapImage() {
        let animation = CABasicAnimation(keyPath: "contents")
        animation.fromValue = UIImage(named: "kitten")?.cgImage
        animation.toValue = UIImage(named: "na")?.cgImage
        animation.duration = 1.0
        imageView.layer.add(animation, forKey: nil)
        imageView.layer.contents = UIImage(named: "na")?.cgImage
    }
}







