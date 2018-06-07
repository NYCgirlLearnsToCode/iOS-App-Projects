//
//  TableViewCell.swift
//  FuzzTest
//
//  Created by Lisa J on 5/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class FuzzTableViewCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var fuzzImageView: UIImageView!
    
    
    @IBOutlet weak var dataTextView: UITextView!
    
    @IBOutlet weak var imageButton: UIButton!
    
    @IBOutlet weak var dataButton: UIButton!
    @IBOutlet weak var idButton: UIButton!
    
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var typeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(fuzzData: FuzzData) {
        idButton.setTitle("Id: \(fuzzData.id)", for: .normal)
        dataTextView.text = "Data: \(fuzzData.data ?? "")"
        typeButton.setTitle("Type: \(fuzzData.type)", for: .normal)
        dateButton.setTitle("Date: \(fuzzData.date ?? "")", for: .normal)
        
    }
    

}
