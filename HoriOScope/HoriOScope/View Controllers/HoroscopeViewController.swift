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

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//check that there is a name and sign
        //        if self.defaults.value
        let name = UserDefaultsHelper.manager.getName() ?? "No name yet"
        
        let sign = UserDefaultsHelper.manager.getSign() ?? "No sign yet"
        
        nameLabel.text = "Welcome: \(name)"
        
        textView.text = "The forecast for \(sign)"
        loadData()
    }
    
    func loadData() {
        let sign = ""
        let date =
        let urlStr = "https://aztro.herokuapp.com/?sign=aries&day=today"
    }
    //so when you click back it will save instead of exiting app to update
    override func viewWillAppear(_ animated: Bool) {
        //if fields are blank
        //else loaddata()
        
    }
   


}

