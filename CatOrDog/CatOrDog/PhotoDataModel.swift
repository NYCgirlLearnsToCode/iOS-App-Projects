//
//  PhotoDataModel.swift
//  CatOrDog
//
//  Created by Lisa J on 12/19/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

//function of class: - manages our photo data
import Foundation
class PhotoDataModel {
    
    //encapsulation - big on interview questions
    //good object oriented programming principles*****
    //make vars private and set setters and getters
    static private var catPhotos = [Photo]()
    static private var dogPhotos = [Photo]()
    
    //setters
    static func setCatPhotos(catPhotos: [Photo]) {
        self.catPhotos = catPhotos
    }
    static func setDogPhotos(dogPhotos: [Photo]) {
        self.dogPhotos = dogPhotos
    }
    //getters
    static func getCatPhotos() -> [Photo] {
        return catPhotos
    }
    static func getDogPhotos() -> [Photo] {
        return dogPhotos
    }
    
}
