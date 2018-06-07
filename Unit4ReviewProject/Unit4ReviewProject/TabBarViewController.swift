//
//  TabBarViewController.swift
//  Unit4ReviewProject
//
//  Created by Lisa J on 1/11/18.
//  Copyright © 2018 Lisa J. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let firstVC = ViewController()
        let secondVC = FavoritesViewController()
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag:0)
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        
        let viewControllerList = [firstVC,secondVC]
            self.viewControllers = viewControllerList.map{UINavigationController(rootViewController: $0)}
        
    }

}
