//
//  ColorChangingModel.swift
//  ColorChanging WithMVC
//
//  Created by Lisa J on 10/17/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
import UIKit

class ColorChangingModel {
    //public API
    func getNextColor() -> (color: UIColor,name : String) {
        return .white , "white"
    }
    func getRandomColor() ->(color: UIColor,name : String){
        return .black, "black"
    }
}
