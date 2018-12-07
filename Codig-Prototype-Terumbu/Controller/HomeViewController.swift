//
//  HomeViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit
import ChameleonFramework

class HomeViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
        setupTabBar()
    }
    
    // MARK: - Private methods
    private func setupNavigationBar(){
        navigationController?.navigationBar.topItem?.title = "Terumbu"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = primaryColour
        navigationController?.navigationBar.tintColor = .white
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
    }
    
    private func setupTabBar(){
        tabBarController?.tabBar.tintColor = .white
        tabBarController?.tabBar.barTintColor = primaryColour
        tabBarController?.tabBar.unselectedItemTintColor = .lightGray
    }
    
}
