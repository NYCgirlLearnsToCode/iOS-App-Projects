//
//  selfDrivingCar.swift
//  ClassesAndObjects
//
//  Created by Lisa J on 11/3/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

class SelfDrivingCar: Car {
    var destination: String?
    
    override func drive() {
        super.drive()
        if let userSetDestination = destination {
            print("driving towards " + destination!)
            
        }
    }
}
