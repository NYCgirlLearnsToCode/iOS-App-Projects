//
//  ViewController.swift
//  ParsingJsonGOTDowncasting
//
//  Created by Lisa J on 11/16/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var episodes = [GOTEpisode]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func loadData(){
        if let path = Bundle.main.path(forResource: "gameOfThronesInfo", ofType: "json") {
            let myURL = URL(fileURLWithPath : path)
            if let data = try? Data(contentsOf: myURL) {
                let episodes = GOTEpisode.getEpisodes(from: data)
                self.episodes = episodes
            }
        }
        for episode in episodes {
            print(episode.name)
        }
    }

}

