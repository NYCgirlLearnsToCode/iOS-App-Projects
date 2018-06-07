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
    private var lists = [Favorites]() {//array to be saved
        didSet {
            saveFavoritesList()
            print(documentDirectory())//prints directory path of saved user defaults
        }
        
    }
    private func documentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0] //the 0 is document folder
    }
    
    //returns document's directory path for app sandbox
    private func dataFilePath(withPathName path: String) -> URL {
        return DataModel.shared.documentDirectory().appendingPathComponent(path)
    }
    
    //save
    private func saveFavoritesList() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(lists)
            try data.write(to: dataFilePath(withPathName: DataModel.kpathName), options: .atomic)
        } catch {
            print("error encoding items: \(error.localizedDescription)")
        }
    }
    
    //load
    public func load() {
        let path = dataFilePath(withPathName: DataModel.kpathName)
        let decoder = PropertyListDecoder()
        do {
            let data = try Data.init(contentsOf: path)
            lists = try decoder.decode([Favorites].self, from: data)
        } catch {
            print("error decoding items: \(error.localizedDescription)")
        }
    }
    //create
    public func addFavoriteItemToList(newItem item: Favorites) {
        lists.append(item)
    }
    
    //read
    public func getLists() -> [Favorites] {//returns favorites array
        return lists
    }
    //update
    public func updateFavoriteItem(withUpdatedItem item: Favorites){
        if let index = lists.index(where: {$0 === item}) {
            lists[index] = item
        }
    }
    
    
}















