//
//  ViewController.swift
//  HoriOScope
//
//  Created by Lisa J on 12/11/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class HoroscopeViewController: UIViewController {
   
    var horoscopes = [Horoscope]() {
        didSet {
            print(horoscopes)
            
        }
    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHoroscopeData()
    }

    func loadHoroscopeData() {
        let selectedSign = "aries"
        let selectedDay = "today"
        let urlStr = "https://aztro.herokuapp.com/?sign=\(selectedSign)&day=\(selectedDay)"
        let setHoroscopeToOnline : (Horoscope) -> Void = { (onlineHoroscopes: Horoscope) in
            self.horoscopes = [onlineHoroscopes]
        }
        HoroscopeAPIClient.manager.getHoroscopes(from: urlStr, completionHandler: setHoroscopeToOnline, errorHandler: {print($0)})
    }


}

