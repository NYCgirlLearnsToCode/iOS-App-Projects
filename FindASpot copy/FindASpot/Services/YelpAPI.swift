//
//  YelpAPI.swift
//  FindASpot
//
//  Created by Lisa J on 1/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation
import MapKit

class YelpAPI {
    static let urlSession = URLSession(configuration: .default)
    
    static func searchVenue(placeName: String, adddressString: String?, coordinate: CLLocationCoordinate2D?, completion: @escaping (Error?, [Place]?) -> Void) {
        
        var urlRequest: URLRequest!
        
        //var urlRequest = URLRequest(url: URL(string: "\(YelpAPIKeys.baseSearchUrl)\(placeName)&location=11375")!)
        
        if let address = adddressString { //e.g. "Queens, NY"
            urlRequest = URLRequest(url: URL(string: "\(YelpAPIKeys.baseSearchUrl)\(placeName)&location=\(address)")!)
        }
        
        //use coordinate
        else {
            
        }
        //TODO: we can have a address string or coordinate
        //TODO: Coordinate is user location coordinate
        //TODO: update our location with coordinate
        
        urlRequest.setValue("Bearer \(YelpAPIKeys.apiKey)", forHTTPHeaderField: "Authorization")
        //required by yelp api for key and value
        urlSession.dataTask(with: urlRequest) {(data, response,error) in
            if let error = error {
                print("error getting data",error)
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let results = try decoder.decode(Results.self, from: data)
                    let places = results.businesses// an array of places
                    completion(nil, places)
                    print("there are \(places.count) places")
                    print("first place is \(places.first?.name)" ?? "no name")
                } catch {
                    print("decoding error:\(error)")
                    completion(error,nil)
                }
                print(data)
            }
        }.resume()
    }
}
