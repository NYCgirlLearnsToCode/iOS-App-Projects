//
//  MapView.swift
//  TwentyFour7
//
//  Created by Lisa J on 1/23/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import SnapKit
import MapKit

class MapView: UIView {
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "Placeholder text"
        label.backgroundColor = .red
        return label
    }()
    
    lazy var mapView: MKMapView = {
       let mv = MKMapView()
        return mv
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
        setupTitleLabel()
        setupMapView()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints{(make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(snp.width).multipliedBy(0.8)
            make.height.equalTo(snp.height).multipliedBy(0.05)
            make.centerX.equalTo(snp.centerX)
        }
    }
    
    private func setupMapView() {
        addSubview(mapView)
        mapView.snp.makeConstraints{(make) in
            make.top.equalTo(titleLabel.snp.bottom).multipliedBy(2)
            make.width.equalTo(snp.width)
            make.height.equalTo(snp.height).multipliedBy(0.5)
            make.centerX.equalTo(snp.centerX)
        }
    }
}
