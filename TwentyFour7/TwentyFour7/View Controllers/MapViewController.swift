//
//  ViewController.swift
//  TwentyFour7
//
//  Created by Lisa J on 1/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
    
    let mapView = MapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        view.backgroundColor = .blue
    }

}

