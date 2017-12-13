//
//  DataModel.swift
//  PixabayNSKeyed
//
//  Created by Lisa J on 12/12/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class DataModel {
    //Mark: FileName
    static let kpathName = "PhotoFavoriteList.plist"
    
    //Singleton
    private init(){}
    static let shared = DataModel()
    
    //Variables
    private var lists = [Photos]() {
        didSet {
//            savePhotoFavoriteList()
            print(documentDirectory())//prints directory path of saved user defaults
        }
        
    }
    func documentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0] //the 0 is document folder
    }
    
    //return supplied path name in documents directory
//    private func dataFilePath {
//
//    }
//
}














