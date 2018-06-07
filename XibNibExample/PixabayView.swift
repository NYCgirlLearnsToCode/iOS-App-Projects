//
//  PixabayView.swift
//  XibNibExample
//
//  Created by Lisa J on 12/18/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class PixabayView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!

    
//    override init(frame: CGRect) {
//        //programmatic init
//    }
    required init?(coder aDecoder: NSCoder) {//storyboard init
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed("PixabayView", owner: self, options: nil)
        //Xib file name ^
        addSubview(contentView)
        contentView.frame = self.bounds
    }

}
