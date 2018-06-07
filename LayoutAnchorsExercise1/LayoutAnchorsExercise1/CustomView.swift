//
//  ExerciseOne.swift
//  LayoutAnchorsExercise1
//
//  Created by Lisa J on 1/4/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class CustomView: UIView {
    //container view,75% of customview,16 pts from left,right and top
    lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()
    
    //label
    lazy var nameLabel: UILabel = {
        let label = UILabel()
       // label.backgroundColor = .red
        //label.font = UIFont.systemFont(ofSize: 27)
        label.text = "Placeholder"
        //placeholder text
        return label
    }()
    
    //image
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "na")
       // iv.image = #imageLiteral(resourceName: "dragon")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init(image: UIImage,
                     text: String,
                     backgroundColor: UIColor,
                     textColor: UIColor) {
        self.init(frame: UIScreen.main.bounds)
        self.imageView.image = image
        self.nameLabel.text = text
        self.backgroundColor = backgroundColor
        self.nameLabel.textColor = textColor
        setupViews()
    }
    
    private func commonInit() {
        setupViews()
    }
    
    private func setupViews() {
        setupContainerView()
        setupNameLabel()
        setupImageView()
    }
    
    private func setupContainerView() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        //mandatory to tell xcode we are setting up constraints
        //constraints isActive must be true for constraints to appear
        containerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier : 0.75).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
     
    }
    
    private func setupNameLabel() {
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 16).isActive = true
        
    }
    
    private func setupImageView() {
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
}
