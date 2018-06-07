//
//  ViewController.swift
//  Unit4ReviewProject
//
//  Created by Lisa J on 1/11/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let searchView = SearchView()
    
    var pixabays = [Hits]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(searchView)
        loadData()
    }
    
    func loadData() {
        let url = "https://pixabay.com/api/?key=7316927-2a8380daf1fdd7eb7b23df261&q=los+angeles"
        let completion = {(onlineImages: [Hits]) in
            self.pixabays = onlineImages
        }
        PixabayAPIClient.manager.getImage(from: url, completionHandler: completion, errorHandler: {print($0, "error getting pixabaydata")})
    }
}



