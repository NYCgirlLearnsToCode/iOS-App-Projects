//
//  CoreDataHelper.swift
//  NumberFactsCoreData
//
//  Created by Lisa J on 2/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class CoreDataHelper {
    private init() {}
    static let manager = CoreDataHelper()
    private let delegate = (UIApplication.shared.delegate as! AppDelegate)
    func save() {
        delegate.saveContext()
    }
    func moc() -> NSManagedCoreData {
        return delegate.persistentContainer.viewContext
    }
}
