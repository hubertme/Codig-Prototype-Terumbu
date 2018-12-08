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
        addDummyDonations()
        
        campaignCollectionView.register(CampaignCardCell.nib, forCellWithReuseIdentifier: CampaignCardCell.cellDescription)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Private methods
    
    // Add campaigns for testing purposes only
    private func addDummyDonations(){
        dummyCampaigns = []
        
        let donation1 = Campaign()
        donation1.title = "Save corals, save Indonesia"
        donation1.description = "Coral reefs in Jayapura are currently increasingly threatened due to human activities, including ship transportation activities and irresponsible fishing activities. 55% of the damage to coral reefs has occurred in this region. Damage to coral reefs will certainly disrupt the survival of marine ecosystem and reduce the variety of the sea."
        donation1.date = Date()
        donation1.location = "Jayapura"
        donation1.donationAmount = 3178500000
        donation1.campaignPIC = "The Indonesia Coral Organization"
        donation1.image = UIImage(named: "coral0") ?? UIImage()
        donation1.reports.append(Report(description: "A total of Rp250,000,000 has been used for the preservation of coral reefs in the waters of Raja Ampat, Indonesia. Donations have been given to local fishing associations who are the target of the campaign in Raja Ampat. This donation is used for the purchase of transplantation supporting tools such as cement, iron frames, and equipment for cutting coral reef seedlings."))
        
        let donation2 = Campaign()
        donation2.title = "No coral, no hope!"
        donation2.description = "Suspendisse nec sagittis leo. Suspendisse at felis egestas tellus ullamcorper fringilla vitae at lorem. Nulla consectetur, urna vitae euismod laoreet, lacus elit convallis nibh, mattis rhoncus ligula elit at erat. Cras sed justo blandit, tincidunt libero ac, vehicula arcu. In hac habitasse platea dictumst. Ut eu vestibulum risus. Nulla sodales tortor purus, eu faucibus lectus porta vitae. Suspendisse euismod nunc lectus. Etiam porta in nisi vitae pellentesque. Mauris blandit dolor eu libero malesuada mollis a nec enim. Praesent ullamcorper ultrices nibh nec auctor. Donec laoreet purus at erat aliquam, ut laoreet purus malesuada. Nulla sit amet mauris enim."
        donation2.date = Date()
        donation2.location = "Tangerang, ID"
        donation2.donationAmount = 150000000
        donation2.campaignPIC = "Universitas Mercu Buana"
        donation2.image = UIImage(named: "coral1") ?? UIImage()
        
        let donation3 = Campaign()
        donation3.title = "Coral-is-me"
        donation3.description = "Integer efficitur consectetur dui, sed viverra risus pulvinar eget. Aliquam ullamcorper ullamcorper sem sit amet pulvinar. Praesent odio magna, pellentesque et fringilla non, hendrerit vitae sem. Vestibulum quis tortor at massa dapibus venenatis quis ut dui. Pellentesque eu massa commodo, scelerisque tellus vel, pellentesque orci."
        donation3.date = Date()
        donation3.location = "Kepulauan Seribu, ID"
        donation3.donationAmount = 125753200
        donation3.campaignPIC = "Universitas Prasetiya Mulya"
        donation3.image = UIImage(named: "coral2") ?? UIImage()
        
        let donation4 = Campaign()
        donation4.title = "1000 corals from Raja Ampat"
        donation4.description = "13,270 sqm coral reef has been totally damaged in the Raja Ampat, Indonesia. Damage to coral reefs is caused by ship activities and ocean currents. Damage to coral reefs causes a lot of losses to the marine ecosystem."
        donation4.date = Date()
        donation4.location = "Raja Ampat Sea"
        donation4.donationAmount = 22504997359.35
        donation4.campaignPIC = "The RICH Foundation"
        donation4.image = UIImage(named: "coral3") ?? UIImage()
        donation4.reports.append(Report(description: "A total of Rp4,500,000,000 has been donated to fishing associations. A total of 120 coral seedlings have been planted in this area. Thanks to the donations given, all the equipment needed for planting coral reefs can be fulfilled."))
        
        let donation5 = Campaign()
        donation5.title = "Manokwari sounds of sea"
        donation5.description = ""
        donation5.location = "Manokwari"
        donation5.donationAmount = 24500745
        donation5.campaignPIC = "The RICH Foundation"
        donation5.image = UIImage(named: "coral4") ?? UIImage()
        
        dummyCampaigns.append(donation1)
        dummyCampaigns.append(donation2)
        dummyCampaigns.append(donation3)
        dummyCampaigns.append(donation4)
        dummyCampaigns.append(donation5)
    }
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
}

