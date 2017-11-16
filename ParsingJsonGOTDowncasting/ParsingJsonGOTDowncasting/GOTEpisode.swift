//
//  GOTEpisode.swift
//  ParsingJsonGOTDowncasting
//
//  Created by Lisa J on 11/16/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
class GOTEpisode {
    let name: String
    let runtime: Int?//optional in case the info is missing
    let mediumImage: String?
    let originalImage: String?
    let summary:String?
    init(name:String, runtime:Int?, mediumImage: String?, originalImage:String?, summary:String) {
        self.name = name
        self.runtime = runtime
        self.mediumImage = mediumImage
        self.originalImage = originalImage
        self.summary = summary
    }
    //from jsonDict that maps string to any
    convenience init?(from jsonDict: [String:Any]) {
        guard let name = jsonDict["name"] as? String else {return nil}
        //downcasts type any to string if cannot return nil
        //        let valueForKeyName = jsonDict["name"]
        //        if let unwrappedValueForKeyName = valueForKeyName {
        //            if let unwrappedValueForKeyNameAsString = unwrappedValueForKeyName as? String{
        //                let a = unwrappedValueForKeyNameAsString
        let runtime = jsonDict["runtime"] as? Int
        let summary = (jsonDict["summary"] as? String) ?? "No summary available"
        var mediumImage: String?
        var originalImage: String?
        if let imageDict = jsonDict["image"] as? [String:String] {
            mediumImage = imageDict["medium"]
            originalImage = imageDict["original"]
        }
        self.init(name: name, runtime: runtime, mediumImage: mediumImage, originalImage: originalImage, summary: summary)
            }
    static func getEpisodes(from data: Data) -> [GOTEpisode] {
        var episodes = [GOTEpisode]()
        do {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        //^class tht turns JSON into foundation object
        //throw means can go catastrophically wrong so have to mark with try and handle with do catch
           //build arr of episodes
            if let episodeDictArray = json as? [[String:Any]] {
                for episodeDict in episodeDictArray {
                    if let episode = GOTEpisode(from: episodeDict) {
                        episodes.append(episode)
                    }
                }
            }
        }
        catch{
            print("Error converting data to JSON")
        }
        return episodes
    }
}


