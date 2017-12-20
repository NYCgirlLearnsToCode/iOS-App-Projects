//
//  ProjectView.swift
//  BehanceAPI
//
//  Created by Lisa J on 12/18/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import Foundation
import UIKit

class ProjectView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("Nib", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
}


