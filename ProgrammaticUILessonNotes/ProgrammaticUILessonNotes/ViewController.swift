//
//  ViewController.swift
//  ProgrammaticUILessonNotes
//
//  Created by Lisa J on 1/2/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

struct AppColor {
    let name: String
    let color: UIColor
    
    static let allColors = [AppColor(name: "green", color: .green),
                            AppColor(name: "blue", color: .blue),
                            AppColor(name: "yellow", color: .yellow),
                            AppColor(name: "cyan", color: .cyan)
                            ]
}

class ViewController: UIViewController {
    var appColor = (color: UIColor.green, name: "green")
    
    lazy var myLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.numberOfLines = 0
        return label
    }()
    
    var currentColorIndex: Int! {
        didSet {
            if currentColorIndex >= AppColor.allColors.count {
                currentColorIndex = 0
            }
            let newColor = AppColor.allColors[currentColorIndex]
            self.view.backgroundColor = newColor.color
            self.myLabel.text = "Welcome to my \(newColor.name) appzzzz "
        }
    }
    
    lazy var segueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Settings", for: .normal)
        button.addTarget(self, action: #selector(segueToSettings), for: .touchUpInside)
        return button
    }()
    
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change Color", for: .normal)
        button.addTarget(self, action: #selector(changeColor), for: UIControlEvents.touchUpInside)
        return button
    }()
    
    @objc func changeColor() {
        currentColorIndex = currentColorIndex + 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentColorIndex = 0
        addSubViews()
        setConstraints()
    }
    
    func addSubViews() {
        self.view.addSubview(myLabel)
        self.view.addSubview(myButton)
        self.view.addSubview(segueButton)
    }
    
    func setConstraints() {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        
        myLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        myLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        myLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -(self.view.bounds.height / 4)).isActive = true
        myLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myButton.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 20).isActive = true
        
        segueButton.translatesAutoresizingMaskIntoConstraints = false
        segueButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        segueButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    @objc func segueToSettings() {
        let settingsVC = SettingsViewController()
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
}

