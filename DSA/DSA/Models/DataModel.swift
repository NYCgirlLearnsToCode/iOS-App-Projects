//
//  DataModel.swift
//  DSA
//
//  Created by Lisa J on 12/12/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class DataModel {
    private init(){}//singleton private so no one else can initialize
    static let kPathName = "DSAListKeyedArchiver.plist"
    
    static let shared = DataModel()
    
    private var lists = [DSA]() {
        didSet {
            //TODO: implement save
            saveDSAList()
        }
    }
    //returns documents directory for the app
    public func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    //returns supplied path name in documents directory
    private func dataFilePath(pathName: String) -> URL {
        return DataModel.shared.documentsDirectory().appendingPathComponent(pathName)
    }
    //save
    func saveDSAList() {
        let path = DataModel.shared.dataFilePath(pathName: DataModel.kPathName).path
        NSKeyedArchiver.archiveRootObject(lists, toFile: path)
        print(documentsDirectory())
        
        //fortesting purposes
    }
    func load() {
        
        let path = DataModel.shared.dataFilePath(pathName: DataModel.kPathName).path
        
        if let results = NSKeyedUnarchiver.unarchiveObject(withFile: path) as? [DSA] {
            
            lists = results
            
        }
        
    }
    
    
    
    //Create
    
    func addDSAItemToList(dsaItem item: DSA) {
        
        lists.append(item)
        
    }
    
    
    
    //Read
    
    func getLists() -> [DSA] {
        
        return lists
        
    }
}
