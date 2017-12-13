//
//  DSA.swift
//  DSA
//
//  Created by Lisa J on 12/12/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

enum DSAPropertyKeys: String {
    case title
    case description
}

class DSA: NSObject, NSCoding {//final means no one else can subclass
    var dsaTitle: String
    var dsaDescription: String
    //class bc needs to b subclassed to nsobject(the umbrella fr all the objects), codable is new method
    
    //saving
    func encode(with aCoder: NSCoder) {
        aCoder.encode(dsaTitle, forKey: DSAPropertyKeys.title.rawValue)//encoded title
        aCoder.encode(dsaDescription, forKey: DSAPropertyKeys.description.rawValue)//encoded descrip
    }
    //loading
   required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObject(forKey: DSAPropertyKeys.title.rawValue) as? String,
            let description = aDecoder.decodeObject(forKey: DSAPropertyKeys.description.rawValue) as? String
            else {return nil}
        self.init(title:title, description:description)
    }
    
    //designated initializer
    init(title: String, description: String) {
        self.dsaTitle = title
        self.dsaDescription = description
    }
    
}
