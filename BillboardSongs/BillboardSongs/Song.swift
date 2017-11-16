//
//  Song.swift
//  BillboardSongs
//
//  Created by Lisa J on 11/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class Song {
    let songName: String
    let displayArtist: String
    init(songName: String, displayArtist: String) {
        self.songName = songName
        self.displayArtist = displayArtist
    }
    convenience init?(from dict: [String : Any]) {
        let songName = dict["song_name"] as? String ?? "Unknown Song"
        let displayArtist = dict["display_artist"] as? String ?? "Unknown Artist"
        self.init(songName: songName, displayArtist: displayArtist)
    }
    static func getSong(from data: Data) -> [Song] {
        var songs = [Song]()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            //cast jsonDict as dictionary format & append to songs object
            guard let jsonDict = json as? [[String: Any]] else {return []}
            for dict in jsonDict {
                if let song = Song.init(from: dict) {
                songs.append(song)
                }
            }
        } catch {
            print("\(error)")
        }
        return songs
    }
}
