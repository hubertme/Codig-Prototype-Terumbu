//
//  ViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class DonationViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    // MARK: - Outlets
    @IBOutlet weak var campaignCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        campaignCollectionView.register(CampaignCardCell.nib, forCellWithReuseIdentifier: CampaignCardCell.cellDescription)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Private methods
}

// MARK: -
extension DonationViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 186)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.selectedCampaign = dummyCampaigns[indexPath.item]
        detailVC.title = "Campaign detail"
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
}

