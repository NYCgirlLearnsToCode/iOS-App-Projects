//
//  FeedView.swift
//  SocialFeedTest
//
//  Created by Lisa J on 1/29/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import SnapKit

class FeedPostsTableView: UIView {
   
    lazy var tableView: UITableView = {
       let tv = UITableView()
        tv.register(postTableViewCell.self, forCellReuseIdentifier: "postTableViewCell")
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupTableView()
    }
    
    private func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints{(make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }

}
