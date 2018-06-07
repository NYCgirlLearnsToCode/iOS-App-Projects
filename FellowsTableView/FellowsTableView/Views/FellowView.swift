//
//  FellowView.swift
//  FellowsTableView
//
//  Created by Lisa J on 1/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class FellowView: UIView {
    
    lazy var tableView: UITableView = {
       let tv = UITableView()
        tv.register(FellowCell.self, forCellReuseIdentifier: "FellowCell")
        tv.backgroundColor = .red
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let allTVConstraints = [
        //tells xcode you are setting constraints
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        allTVConstraints.forEach{$0.isActive = true}
    }
    
}
