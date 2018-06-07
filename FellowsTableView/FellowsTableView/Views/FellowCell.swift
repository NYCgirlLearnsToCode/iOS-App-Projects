//
//  FellowCell.swift
//  FellowsTableView
//
//  Created by Lisa J on 1/5/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class FellowCell: UITableViewCell {
   
    //imgview
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .green
        return imageView
    }()
    
    //label
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
       // label.backgroundColor = .blue
        return label
    
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FellowCell")
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
    
    override func layoutSubviews() {
        //we get frame of UI elements here
        super.layoutSubviews()
        //have to call super everytime its override
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2.0
        profileImageView.layer.masksToBounds = true
        //keeps it within the bounds
    }
    
    private func setupViews() {
        setupProfileImage()
        setupNameLabel()
    }
    
    private func setupProfileImage() {
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        let profileImageConstraints = [
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        profileImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor),       profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ]
        profileImageConstraints.forEach{$0.isActive = true}
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    public func configureCell(fellow: Fellow) {
        nameLabel.text = fellow.name
        if let imageURL = fellow.imageURL {
            if let image = ImageCache.manager.cachedImage(url: imageURL) {
                profileImageView.image = image
            } else {
                ImageCache.manager.processImageInBackground(imageURL: imageURL, completion: {(error, image) in
                    if let error = error {
                        print("fellowCell - error processing image: \(error.localizedDescription)")
                    } else if let image = image {
                        DispatchQueue.main.async {
                            self.profileImageView.image = image
                        }
                    }
                })
            }
        } else {
            profileImageView.image = UIImage(named: "na")
        }
        
    }


}
