//
//  PlaceViewController.swift
//  FindASpot
//
//  Created by Lisa J on 1/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit
import MapKit//has corelocation in it

class PlaceViewController: UIViewController {

    let placeView = PlaceView()
    
    private var places = [Place](){
        didSet{
            //update map with new annotations
            for place in places {
                var annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2DMake(place.coordinates.latitude, place.coordinates.longitude)
                annotation.title = place.name
                annotations.append(annotation)
            }
            //adding annotation to mapview - update ui
            DispatchQueue.main.async {
                self.placeView.mapView.addAnnotations(self.annotations)
                self.placeView.mapView.showAnnotations(self.annotations, animated: true)
            }
        }
    }
    
    private var annotations = [MKAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(placeView)
        placeView.venueSearchBar.delegate = self
        placeView.locationSearchBar.delegate = self
        
        
        configureNavBar()
        
        let _ = LocationService.manager.checkForLocationServies()
        
    }
    
    private func configureNavBar() {
        navigationItem.title = "Find A Spot"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = placeView.venueSearchBar
        //assigning searchbar view to navbar's title view
        
    }
}

extension PlaceViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // validate venue search
        guard let text = placeView.venueSearchBar.text else {print("venue search is nil") ; return} //checking for nil
        guard !text.isEmpty else {print("venue text is empty"); return}
       
        //check for spaces eg "Burrito Bowl"
        guard let encodedVenueSearch = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {print("spaces not allowed"); return}
       
        var address: String!
        
        //validate address search
        guard let addressText = placeView.locationSearchBar.text else {print("nil address");return}
        guard !addressText.isEmpty else {print("address is empty"); return}
        guard let encodedAddressSearch = addressText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {print("bad encoding of address"); return}
        
        //Calls yelp api with serach query
        YelpAPI.searchVenue(placeName: encodedVenueSearch, adddressString: encodedAddressSearch, coordinate: nil) {(error, places) in
            if let error = error {
                //TODO: Handle errors
                print(error)
            } else if let places = places {
                DispatchQueue.main.async {
                    self.places.removeAll()
                    self.placeView.mapView.removeAnnotations(self.annotations)
                    self.annotations.removeAll()
                    self.places = places
                }
            }
        }
        
        searchBar.resignFirstResponder()
    }
}
