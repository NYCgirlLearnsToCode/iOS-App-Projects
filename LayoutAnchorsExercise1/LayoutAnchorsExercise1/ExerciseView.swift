//
//  ExerciseView.swift
//  LayoutAnchorsExercise1
//
//  Created by Lisa J on 1/4/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ExerciseView: UIView {

    // four custom views
    
    lazy var pitonView: CustomView = {
       let view = CustomView(image: #imageLiteral(resourceName: "ptions"),
                             text: "The Pitons",
                             backgroundColor: .green,
                             textColor: .black)
        return view
    }()
    
    lazy var monkeyView: CustomView = {
        let monkeyView = CustomView(image: #imageLiteral(resourceName: "monkey"), text: "Monkey", backgroundColor: .red, textColor: .black)
        return monkeyView
    }()
    
    lazy var dragonView: CustomView = {
       let dragonView = CustomView(image: #imageLiteral(resourceName: "dragon"), text: "Dragon", backgroundColor: .yellow, textColor: .black)
        return dragonView
    }()
    
    lazy var heartView: CustomView = {
        let heartView = CustomView(image: #imageLiteral(resourceName: "heart"), text: "Heart", backgroundColor:.blue , textColor: .white)
        return heartView
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
    
    func setupViews() {
        setupPitonView()
        setupMonkeyView()
        setupDragonView()
        setupHeartView()
    }
    
    func setupPitonView() {
        addSubview(pitonView)
        pitonView.translatesAutoresizingMaskIntoConstraints = false
        pitonView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        pitonView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        pitonView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        pitonView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.50).isActive = true
        
    }
    
    func setupMonkeyView() {
        addSubview(monkeyView)
        monkeyView.translatesAutoresizingMaskIntoConstraints = false
        monkeyView.topAnchor.constraint(equalTo: pitonView.bottomAnchor).isActive = true
        monkeyView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        monkeyView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        monkeyView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func setupDragonView() {
        addSubview(dragonView)
        dragonView.translatesAutoresizingMaskIntoConstraints = false
        dragonView.leadingAnchor.constraint(equalTo: pitonView.trailingAnchor).isActive = true
        dragonView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dragonView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        dragonView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
    }
    
    func setupHeartView() {
        addSubview(heartView)
        heartView.translatesAutoresizingMaskIntoConstraints = false
        heartView.topAnchor.constraint(equalTo: dragonView.bottomAnchor).isActive = true
        heartView.leadingAnchor.constraint(equalTo: monkeyView.trailingAnchor).isActive = true
        heartView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        heartView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        
    }
    
}
