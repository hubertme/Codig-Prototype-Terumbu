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
    
    // MARK: - Dummy data
    let newsTitleData: Array<String> = ["Save our corals!", "Two coral reefs known broken in a beach", "Coral plantation is the future of saving corals", "Crowdfunding as the solution for saving environment", "New method of coral farming is under research"]
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // MARK: - Outlets
    @IBOutlet var headingLabels: [UILabel]!
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var locationCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for headingLabel in headingLabels{
            headingLabel.textColor = primaryColour
        }
        
        // Set delegate and data source
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
//        locationCollectionView.delegate = self
//        locationCollectionView.dataSource = self
        
        newsCollectionView.register(NewsCardCell.nib, forCellWithReuseIdentifier: NewsCardCell.cellDescription)
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 0 ? newsTitleData.count : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView.tag == 0){
            let newsCell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: NewsCardCell.cellDescription, for: indexPath) as! NewsCardCell
            newsCell.newsTitleLabel.text = newsTitleData[indexPath.item]
            newsCell.newsImageView.image = UIImage(named: "news-image\(indexPath.item)")
            return newsCell
        }
        return UICollectionViewCell()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView.tag == 0){
            return CGSize(width: 324, height: 187)
        }
        return CGSize(width: 0, height: 0)
    }
}
