//
//  Favorites.swift
//  Unit4Week1
//
//  Created by Lisa J on 12/21/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
import UIKit

class Favorites: Codable {
    //properties
    let title: String?
    let imageUrl: String?
    //init
    init(title: String?, imageUrl: String?) {
        self.title = title
        self.imageUrl = imageUrl
    }//self refers to the what encapsulates it
    
}
