//
//  LocationService.swift
//  FindASpot
//
//  Created by Lisa J on 1/19/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService:NSObject {
    //Location manager requires NS Object,NS Object is the umbrella of foundation objects
    
    //MARK: View Life Cycle
    
    //singleton manager
    //Apple highly recommends having 1 instance of location manager
    private override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    }
    static let manager = LocationService()
    
    private var locationManager: CLLocationManager!
    
}

//Helper Functions
extension LocationService {
    public func checkForLocationServies() -> CLAuthorizationStatus {
        var status: CLAuthorizationStatus!
        
        //check if location services is enabled
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus()  {
                case .notDetermined: //initial state on first launch
                print("not determined")
                locationManager.requestWhenInUseAuthorization()
                status = CLAuthorizationStatus.notDetermined
                case .denied://user could deny potentially access
                print("denied")
                case .authorizedWhenInUse:
                print("when in use")
                case .authorizedAlways:
                print("authorized always")
                default:
                break
            }
            status = CLLocationManager.authorizationStatus()
        }
        
            //update UI to inform user
        else {
            
        }
        return status
    }
}

extension LocationService: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations: \(locations)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("didFailWithError: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangeAuthorization: \(status)")//e.g .denied, .notDetermined
    }
    
}
