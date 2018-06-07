//
//  Post.swift
//  NumberFactsCoreData
//
//  Created by Lisa J on 2/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation

extension Post {
    convenience init(title: String, number: Double, user: User) {
        let moc = CoreDataHelper.manager.moc()
        self.init(context: moc)
    }
}
