//
//  ViewController.swift
//  BehanceAPI
//
//  Created by Lisa J on 12/18/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var uiView: ProjectView!
    
    @IBOutlet weak var uiView2: ProjectView!
    var project: Project! {
        didSet {
            uiView.titleLabel.text = "Hi"
            uiView.imageView.image = #imageLiteral(resourceName: "na")
            uiView2.titleLabel.text = "Hello"
            uiView2.imageView.image = #imageLiteral(resourceName: "na")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTest()
    }

    func loadTest() {
        self.project = Project.testProjects[0]
    }

}

