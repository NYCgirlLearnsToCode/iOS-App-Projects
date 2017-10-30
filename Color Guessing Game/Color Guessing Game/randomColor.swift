//
//  randomColor.swift
//  Color Guessing Game
//
//  Created by Lisa J on 10/17/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
import UIKit

class randomColor {
    let colors: [UIColor] = [.red, .green, .blue]
    func getRandomColor() -> UIColor {
        let randomIndex = Int(arc4random_uniform(UInt32((2))))
        return colors[randomIndex]
    }
}
