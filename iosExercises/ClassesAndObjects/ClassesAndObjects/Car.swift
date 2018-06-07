//
//  Car.swift
//  ClassesAndObjects
//
//  Created by Lisa J on 11/3/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

enum carType {//custom data type
    case Coupe, Hatchback, Sedan
}

class Car {
    var color = "Black"
    var numberOfSeats = 5
    var typeOfCar: carType = .Sedan
    init(){
        
    }
    convenience init(customerChosenColor: String) {
       self.init()
        color = customerChosenColor
    }
    func drive() {
        print("Car is moving")
    }
}
