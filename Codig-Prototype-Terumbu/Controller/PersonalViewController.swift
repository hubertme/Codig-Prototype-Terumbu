//
//  PersonalViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 07/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit
import Firebase

class PersonalViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // MARK: - Outlets
    @IBOutlet weak var campaignCollectionView: UICollectionView!
    @IBOutlet weak var needLoginView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campaignCollectionView.register(CampaignCardCell.nib, forCellWithReuseIdentifier: CampaignCardCell.cellDescription)
        
        campaignCollectionView.delegate = self
        campaignCollectionView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
        
        if (currentUser !=  nil){
            needLoginView.alpha = 0
        } else {
            needLoginView.alpha = 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem()
    }
    
    // MARK: - Private methods
    private func setupNavigationBar(){
        navigationController?.navigationBar.topItem?.title = "My Donation"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(handleUserSignOut))
        
        if (currentUser == nil){
            navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem()
        }
    }
    
    @objc private func handleUserSignOut(){
        let alertController = UIAlertController(title: "Sign Out", message: "Are you sure you want to sign out?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            do{
                try Auth.auth().signOut()
                currentUser = nil
                
                UIView.animate(withDuration: 1, animations: {
                    self.needLoginView.alpha = 1
                })
                self.setupNavigationBar()
            } catch {
                print("Failed to sign out:", error.localizedDescription)
            }
        }
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func navigateToLoginPage(){
        let loginVC = LoginViewController()
        self.present(loginVC, animated: true, completion: nil)
    }
}

extension PersonalViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dummyCampaigns.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = campaignCollectionView.dequeueReusableCell(withReuseIdentifier: CampaignCardCell.cellDescription, for: indexPath) as! CampaignCardCell
        let currentCampaign = dummyCampaigns[indexPath.row]
        
        cardCell.titleLabel.text = currentCampaign.title
        cardCell.organisationLabel.text = currentCampaign.campaignPIC
        cardCell.campaignImageView.image = currentCampaign.image
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id-ID")
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        
        cardCell.donationLabel.text = currencyFormatter.string(from: NSNumber(value: currentCampaign.donationAmount))
        return cardCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.selectedCampaign = dummyCampaigns[indexPath.item]
        detailVC.title = "Campaign detail"
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 186)
    }
}
