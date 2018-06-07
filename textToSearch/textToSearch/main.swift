//
//  main.swift
//  textToSearch
//
//  Created by Lisa J on 5/15/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

print("Hello, World!")

func returnIndex(str:String, query:String) -> Int? {
    
    let strArr = str.components(separatedBy: " ")
    if query.count > 1 {
        for (index,elem) in strArr.enumerated() {
            if elem.contains(query) {
                print(index);return index
            }
        }
    } else {
        for (index,char) in str.enumerated() {
            if String(char) == query {
                print(index);return index
            }
        }
    }
    print("n/a");return nil
}
returnIndex(str: "hi wow924 b6 ", query: "wo")
