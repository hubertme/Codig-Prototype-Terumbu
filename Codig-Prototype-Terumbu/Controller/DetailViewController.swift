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
    
    var selectedAction = CoralAction()
    
    // MARK: - Outlets
    @IBOutlet weak var pageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTableView.tableFooterView = UIView()
        pageTableView.separatorStyle = .none
        
        pageTableView.register(DetailCell.nib, forCellReuseIdentifier: DetailCell.cellDescription)
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
        
        cell.descriptionLabel.text = selectedAction.description
        cell.locationLabel.text = selectedAction.location
        cell.coralImageView.image = selectedAction.image
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        cell.dateLabel.text = dateFormatter.string(from: selectedAction.date)
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id-ID")
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        cell.donationAmountLabel.text = currencyFormatter.string(from: NSNumber(value: selectedAction.donationAmount))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
