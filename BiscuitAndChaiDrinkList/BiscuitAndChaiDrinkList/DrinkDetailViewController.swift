//
//  DrinkDetailViewController.swift
//  BiscuitAndChaiDrinkList
//
//  Created by Lisa J on 11/25/17.
//  Copyright © 2017 Lisa J. All rights reserved.
//

import UIKit

class DrinkDetailViewController: UIViewController {

    var drink: DrinkWrapper!
    
    @IBOutlet weak var drinkDetailImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func loadImg() {
            if let url = URL(string: drink.Image) {
                DispatchQueue.global().sync {
                    //loading async
                    print("1")
                    if let data = try? Data.init(contentsOf: url) {
                        //updates UI on main thread
                        print("2")
                        DispatchQueue.main.async {
                            print("3")
                            self.drinkDetailImage.image = UIImage(data: data)
                        }
                    }
                }
            }
        }
        
    }


