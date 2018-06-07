//
//  DBService.swift
//  JobMktPlace
//
//  Created by Lisa J on 2/1/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DBService {
    private init() {
        //ref root of database
        dbRef = Database.database().reference()
        //children of the root
        usersRef = dbRef.child("users")
        jobsRef = dbRef.child("jobs")
        imagesRef = dbRef.child("images")
        categoriesRef = dbRef.child("categories")
    }
    static let manager = DBService()
    //root of the database
    public var dbRef: DatabaseReference!
    private var usersRef: DatabaseReference!
    private var jobsRef: DatabaseReference!
    private var imagesRef: DatabaseReference!
    private var categoriesRef: DatabaseReference!
    
    public func getDB() -> DatabaseReference {return dbRef}
    public func getUsers() -> DatabaseReference {return usersRef}
    public func getJobs() -> DatabaseReference {return jobsRef}
    public func getImages() -> DatabaseReference {return imagesRef}
    public func getCategories() -> DatabaseReference {return categoriesRef}
}
