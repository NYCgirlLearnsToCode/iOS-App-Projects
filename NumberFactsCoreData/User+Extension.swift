//
//  User+Extension.swift
//  NumberFactsCoreData
//
//  Created by Lisa J on 2/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

extension User {
    convenience init(name: String, dob: Date) {
        let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        self.init(context: moc)
        self.name = name
        self.dob = dob
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.saveContext()
    }
}
