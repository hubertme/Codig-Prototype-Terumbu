//
//  DetailViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    var selectedCampaign = Campaign()
    
    // MARK: - Outlets
    @IBOutlet weak var pageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTableView.tableFooterView = UIView()
        pageTableView.separatorStyle = .none
        
        pageTableView.register(DetailCell.nib, forCellReuseIdentifier: DetailCell.cellDescription)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    // MARK: Private methods
}

// MARK: -
extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = pageTableView.dequeueReusableCell(withIdentifier: DetailCell.cellDescription, for: indexPath) as! DetailCell
        cell.selectionStyle = .none
        
        cell.descriptionLabel.text = selectedCampaign.description
        cell.locationLabel.text = selectedCampaign.location
        cell.coralImageView.image = selectedCampaign.image
        cell.picLabel.text = selectedCampaign.campaignPIC
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        cell.dateLabel.text = dateFormatter.string(from: selectedCampaign.date)
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id-ID")
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        cell.donationAmountLabel.text = currencyFormatter.string(from: NSNumber(value: selectedCampaign.donationAmount))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
