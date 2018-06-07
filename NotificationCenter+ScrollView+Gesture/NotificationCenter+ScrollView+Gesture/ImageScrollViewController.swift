//
//  ImageScrollViewController.swift
//  NotificationCenter+ScrollView+Gesture
//
//  Created by Lisa J on 1/16/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ImageScrollViewController: UIViewController {
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "shire")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    var scrollView = UIScrollView()
    var contentView = UIView()
    
    lazy var pinchRecognizer: UIPinchGestureRecognizer = {
        let pr = UIPinchGestureRecognizer(target: self, action: #selector(respondToPinch))
        return pr
    }()
    
    @objc func respondToPinch() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.addGestureRecognizer(pinchRecognizer)
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let _ = scrollView.constraintsToPinToEdges(of: view).map{ $0.isActive = true }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let _ = contentView.constraintsToPinToEdges(of: scrollView).map{ $0.isActive = true }
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let _ = imageView.constraintsToPinToEdges(of: contentView).map{ $0.isActive = true }
    }
}


extension UIView {
    func constraintsToPinToEdges(of view: UIView) -> [NSLayoutConstraint] {
        return [leadingAnchor.constraint(equalTo: view.leadingAnchor),
                trailingAnchor.constraint(equalTo: view.trailingAnchor),
                topAnchor.constraint(equalTo: view.topAnchor),
                bottomAnchor.constraint(equalTo: view.bottomAnchor)]
    }
}

