//
//  ViewController.swift
//  MapKit+CoreLocation
//
//  Created by Lisa J on 1/18/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
//relies on delegates to get info
class ViewController: UIViewController, CLLocationManagerDelegate, UISearchBarDelegate, MKMapViewDelegate {
    
    private var locationManager: CLLocationManager!
    var annotations: [MKAnnotation]!
    var searchController:UISearchController!
    var localSearchRequest: MKLocalSearchRequest!
    var localSearch: MKLocalSearch!
    var localSearchResponse: MKLocalSearchRequest!
    
    @IBOutlet weak var mapKit: MKMapView!
    
    
    @IBAction func requestButtonPressed(_ sender: UIBarButtonItem) {
        print("tapped")
        switch  CLLocationManager.authorizationStatus() {
        case .authorizedAlways, .authorizedWhenInUse:
            print("authorized")
        case .denied, .restricted:
            print("authorization denied")
            guard let validSettingsURL: URL = URL(string: UIApplicationOpenSettingsURLString) else {return}
            UIApplication.shared.open(validSettingsURL, options: [:], completionHandler: nil)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        }
//        default:
//            break
//        }
//no longer needed bc we ar handling all
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mapKit.mapType = MKMapType.hybridFlyover
        //MapType
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonAction))
        self.navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc func searchButtonAction() {
        if searchController == nil {
            searchController = UISearchController(searchResultsController: nil)//nil bc it's not going to another controller
        }
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        //keyboard goes away after something is seaarched in srchbar
        if mapKit.annotations.count != 0 {
            
            annotations = mapKit.annotations
            mapKit.removeAnnotations(annotations)
        }
        
        localSearchRequest = MKLocalSearchRequest()//instantiated
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start{[weak self](localSearchResponse, error)-> Void in
            if localSearchResponse == nil {
                let alert = UIAlertController(title: "No Place found", message: "try again", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
                return
            }
            let searchResults: [MKMapItem] = localSearchResponse!.mapItems
            let searchRegion = MKCoordinateRegion(center: localSearchResponse!.boundingRegion.center, span: MKCoordinateSpan(latitudeDelta: localSearchResponse!.boundingRegion.span.latitudeDelta, longitudeDelta: localSearchResponse!.boundingRegion.span.longitudeDelta))
            
                dump(localSearchResponse)
                self?.mapKit.setRegion(searchRegion, animated: true)
            var annotations = [MKPinAnnotationView]()
            searchResults.forEach{
                let pointAnnotation = MKPointAnnotation()
                pointAnnotation.title = searchBar.text
                pointAnnotation.coordinate = $0.placemark.coordinate
                let pinAnnotationView = MKPinAnnotationView(annotation: pointAnnotation, reuseIdentifier: nil)
                annotations.append(pinAnnotationView)
                
                
                
            }
            
            self?.mapKit.addAnnotations(annotations.map{$0.annotation!})
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        determineMyLocation()
        
    }
    
    func determineMyLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self// we recieve notifs when anything changes
        locationManager.desiredAccuracy = kCLLocationAccuracyBest //most accurate & drains battery
        //locationManager.requestWhenInUseAuthorization() //Best practice
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()//must start updating for the delegate methods to run
        }

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        print("user latitude = \(userLocation.coordinate.latitude)")
        print("user longitude = \(userLocation.coordinate.longitude)")
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        //puts your own pin down
        //  let userAnnotation = MKPointAnnotation()
        //userAnnotation.coordinate = userLocation.coordinate
        //userAnnotation.title = "this is us"
        //mapKit.addAnnotation(userAnnotation)
        
        mapKit.showsUserLocation = true
        mapKit.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()// stops updating after location received
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error")
    }

}

