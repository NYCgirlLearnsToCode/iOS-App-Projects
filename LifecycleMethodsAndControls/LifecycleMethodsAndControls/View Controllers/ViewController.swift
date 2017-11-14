//
//  ViewController.swift
//  LifecycleMethodsAndControls
//
//  Created by Lisa J on 11/7/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UIView!
    let colorName = "blue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Root: viewDidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillLayoutSubviews() {//is called 2x and then gets called again when iphone is rotated
        super.viewWillLayoutSubviews()// super because in override view did load so just do for all
        
        print("Root: viewWillLayoutSubviews")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Root: viewWillAppear; animated : \(animated)")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Root: viewDidAppear ; animated : \(animated)")
    }
    
    //App is on screen and running
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Root: viewWillDisappear ; animated : \(animated)")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("Root: viewDidDisappear; animated : \(animated)")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//never access UI elements bc they might not exist
        if let destination = segue.destination as? DetailViewController {
            destination.passedInColor = self.colorName
        }
    }
}

