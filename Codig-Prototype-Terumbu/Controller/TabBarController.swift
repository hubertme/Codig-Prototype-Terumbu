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
    
    private func addViewControllers(){
        let homeVC = HomeViewController()
        let donationVC = DonationViewController()
//        let profileVC = ProfileViewController()
        
//        homeVC.tabBarItem = UITabBarItem(title: "Home", image: <#T##UIImage?#>, tag: <#T##Int#>)
//        donationVC.tabBarItem = UITabBarItem(title: "Donation", image: <#T##UIImage?#>, tag: <#T##Int#>)
//        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: <#T##UIImage?#>, tag: <#T##Int#>)
        
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        donationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        viewControllers = [homeVC, donationVC]
    }

}
