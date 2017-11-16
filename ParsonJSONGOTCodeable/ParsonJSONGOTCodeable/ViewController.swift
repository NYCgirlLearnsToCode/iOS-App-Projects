//
//  ViewController.swift
//  ParsonJSONGOTCodeable
//
//  Created by Lisa J on 11/16/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var episodes = [GOTEpisode]()
    var pods = [Pod]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        loadPodData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadPodData() {
        if let path = Bundle.main.path(forResource: "PodcastInfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do {
                    let allPodInfo = try myDecoder.decode(PodInfo.self, from: data)
                    self.pods = allPodInfo.pods
                }
                catch {
                    print(error)
                }
            }
        }
    }

    func loadData() {
        if let path = Bundle.main.path(forResource: "gameOfThronesInfo", ofType: "json") {
            let myURL = URL(fileURLWithPath: path)
            if let data = try? Data(contentsOf: myURL) {
                let myDecoder = JSONDecoder()
                do{
                    let episodes = try myDecoder.decode([GOTEpisode].self, from: data)
                    self.episodes = episodes
                }
                catch let error{
                    print(error)
                }
            }
        }
        for episode in episodes {
            print(episode.name, episode.image.medium, episode._links.`self`.href)
        }
    }


}

