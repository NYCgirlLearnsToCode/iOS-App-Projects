//
//  PodsInfo.swift
//  ParsonJSONGOTCodeable
//
//  Created by Lisa J on 11/16/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

struct PodInfo: Codable {//to access the json file
    let meta: PodMetaData
    let pods: [Pod]
}
struct PodMetaData: Codable {
    let data_requested: String
}
struct Pod: Codable {//go down levels into info
    let podcast: String
    let url: String
    let episodes: [PodEpisode]
}
struct PodEpisode: Codable {
    let title: String
    let number: Int
}
