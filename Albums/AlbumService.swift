//
//  AlbumService.swift
//  Albums
//
//  Created by Lisa J on 11/14/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
class AlbumService {
    //retrieving json file and doing conversion
    static func fetchAlbums() -> [Album]?{
        var albums = [Album]()
        
        //reading from local file
        //bundle.main.path is all files
        //forResource is the specific file
        if let pathExit = Bundle.main.path(forResource: "AlbumData", ofType: "json") {
            guard let data = NSData.init(contentsOfFile: pathExit) else {return nil}
        //parsing json, use do catch for error throws?
            do {
                //JSONSerialization
                //NSData(obj C) cast as Data to make it a swift project
                let json = try JSONSerialization.jsonObject(with: data as Data, options: [])
                //albumData.json is a dictionary, type any because we don't know what type could be image,numbers
                guard let jsonDict = json as? [String: Any] else {return nil}
                guard let results = jsonDict["results"] as? [Any] else {return nil} //results is an array
                
                //create aLBUMS
                for result in results{
                    if let resultDict = result as? [String: Any] {
                        
                        //create our Album Model Object
                        let album = Album.init(resultDict: resultDict)
                        //some titles are empty
                        if !album.collectionName.isEmpty {
                            albums.append(album)
                        }
                    }
                }
            } catch {
                print("error: \(error.localizedDescription)")
            }
            return albums
        } else {
            print("file not found")
            return nil
        }
    }
}

