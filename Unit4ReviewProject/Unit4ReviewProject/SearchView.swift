//
//  SearchView.swift
//  Unit4ReviewProject
//
//  Created by Lisa J on 1/11/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    lazy var textField: UITextField = {
       let tf = UITextField()
        tf.backgroundColor = .gray
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupTextField()
    }
    
    func setupTextField() {
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        textField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
    }

}
