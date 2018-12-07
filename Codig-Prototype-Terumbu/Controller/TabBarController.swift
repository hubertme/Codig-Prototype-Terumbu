//
//  TabBarController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addViewControllers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func addViewControllers(){
        let homeVC = HomeViewController()
        let personalVC = PersonalViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "icon-home")!, tag: 0)
        personalVC.tabBarItem = UITabBarItem(title: "My Donation", image: UIImage(named: "icon-donation")!, tag: 1)
        
        viewControllers = [homeVC, personalVC]
    }
}
