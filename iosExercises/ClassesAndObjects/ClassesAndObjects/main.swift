//
//  main.swift
//  ClassesAndObjects
//
//  Created by Lisa J on 11/3/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation

print("Hello, World!")

let myCar = Car(customerChosenColor: "Red")
//print(myCar.color)
//print(myCar.numberOfSeats)
//print(myCar.typeOfCar)
let someRichGuysCar = Car(customerChosenColor: "Gold")
//print(someRichGuysCar.color)
//print(someRichGuysCar.numberOfSeats)
//print(someRichGuysCar.typeOfCar)
myCar.drive()
let mySelfDrivingCar = SelfDrivingCar()
mySelfDrivingCar.destination = "1 Hacker Way"
mySelfDrivingCar.drive()

print(mySelfDrivingCar.color)

