//
//  PlaceView.swift
//  FindASpot
//
//  Created by Lisa J on 1/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import MapKit

class PlaceView: UIView {

    lazy var venueSearchBar: UISearchBar = {
       let sb = UISearchBar()
        sb.placeholder = "What venue are you searching for?"
        return sb
    }()
    
    lazy var locationSearchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "What location are you searching for?"
        sb.barTintColor = .white
        return sb
    }()
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.showsUserLocation = true
        return map
    }()
    
    lazy var userTrackingButton: MKUserTrackingButton = {
       let trackingButton = MKUserTrackingButton()
        return trackingButton
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
        backgroundColor = .white
        setupLocationSearchBar()
        setupMapView()
        setupUserTrackingButton()
        userTrackingButton.mapView = mapView
    }
    
    
    private func setupLocationSearchBar() {
        addSubview(locationSearchBar)
        locationSearchBar.translatesAutoresizingMaskIntoConstraints = false
        locationSearchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        locationSearchBar.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        locationSearchBar.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        locationSearchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupMapView() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: locationSearchBar.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func setupUserTrackingButton() {
        addSubview(userTrackingButton)
        userTrackingButton.translatesAutoresizingMaskIntoConstraints = false
        userTrackingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        userTrackingButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }

}

