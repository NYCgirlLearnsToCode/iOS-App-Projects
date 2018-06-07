//
//  ScrollView.swift
//  NotificationCenter+ScrollView+Gesture
//
//  Created by Lisa J on 1/16/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ScrollView: UIView {
    
    lazy var scrollView: UIScrollView = {
       let sv = UIScrollView()
        return sv
    }()
    
    lazy var contentView: UIView = {
        let cv = UIView()
        return cv
    }()
    
    lazy var captionLabel: UILabel = {
        let cl = UILabel()
        return cl
    }()
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    lazy var submitButton: UIButton = {
        let but = UIButton()
        return but
    }()
    
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(captionLabel)
        contentView.addSubview(textField)
        contentView.addSubview(submitButton)
        contentView.addSubview(imageView)
    }
    private func configureConstraints() {
        configureScrollView()
        configureContentView()
        configureCaptionLabel()
        configureTextField()
        configureSubmitButton()
        configureImageView()
    }
    private func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        //Needed because the constraints of the views inside our content view don't define its size.  If they did, we could remove these two lines
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
    }
    
    
    private func configureCaptionLabel() {
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        captionLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
    }
    private func configureTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.bottomAnchor.constraint(equalTo: submitButton.topAnchor, constant: -20).isActive = true
        textField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    private var buttonBottomConstraint = NSLayoutConstraint()
    
    private func configureSubmitButton() {
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        buttonBottomConstraint = submitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        buttonBottomConstraint.isActive = true
        submitButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    private func configureImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -100).isActive = true
        imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
        imageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
    }

}
