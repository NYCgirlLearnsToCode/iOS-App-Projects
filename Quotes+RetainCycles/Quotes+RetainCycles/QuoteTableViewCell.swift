//
//  QuoteTableViewCell.swift
//  Quotes+RetainCycles
//
//  Created by Lisa J on 2/15/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

protocol QuoteTableViewCellDelegate {
    func userLiked(quote: Quote)
}

class QuoteTableViewCell: UITableViewCell {

    weak var quoteLabel: UILabel!
    
    func configureCell(with quote: Quote) {
        quoteLabel.text = "\(quote.text)\n~~~\(quote.author)"
    }
    

}
