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
    
    var donations: Array<Campaign> = []

    // MARK: - Outlets
    @IBOutlet weak var donationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyDonations()
        
        donationTableView.register(DonationTableViewCell.nib, forCellReuseIdentifier: DonationTableViewCell.cellDescription)
        donationTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }

    // MARK: - Private methods
    private func setupNavigationBar(){
        navigationController?.navigationBar.topItem?.title = "Donasiku"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // Add donations for testing purposes only
    private func addDummyDonations(){
        let donation1 = Campaign()
        donation1.title = "First item"
        donation1.description = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ex justo, interdum ac consectetur eu, rutrum vitae mi. Aenean malesuada ex eu placerat commodo. Suspendisse nec sagittis leo. Suspendisse at felis egestas tellus ullamcorper fringilla vitae at lorem. Nulla consectetur, urna vitae euismod laoreet, lacus elit convallis nibh, mattis rhoncus ligula elit at erat. Cras sed justo blandit, tincidunt libero ac, vehicula arcu. In hac habitasse platea dictumst. Ut eu vestibulum risus. Nulla sodales tortor purus, eu faucibus lectus porta vitae. Suspendisse euismod nunc lectus. Etiam porta in nisi vitae pellentesque. Mauris blandit dolor eu libero malesuada mollis a nec enim. Praesent ullamcorper ultrices nibh nec auctor. Donec laoreet purus at erat aliquam, ut laoreet purus malesuada. Nulla sit amet mauris enim.
        
        Integer efficitur consectetur dui, sed viverra risus pulvinar eget. Aliquam ullamcorper ullamcorper sem sit amet pulvinar. Praesent odio magna, pellentesque et fringilla non, hendrerit vitae sem. Vestibulum quis tortor at massa dapibus venenatis quis ut dui. Pellentesque eu massa commodo, scelerisque tellus vel, pellentesque orci. Nam fermentum malesuada bibendum. Suspendisse finibus, libero non tempus maximus, libero risus ultrices ligula, vitae consequat magna est vel leo. Praesent vitae ante nec tortor ullamcorper luctus sed sed ante. Sed sagittis suscipit mauris vel lobortis. Morbi vitae bibendum massa.
        """
        donation1.date = Date()
        donation1.location = "Jakarta, ID"
        donation1.donationAmount = 150000000.20
        
        let donation2 = Campaign()
        donation2.title = "Second item"
        donation2.description = "Suspendisse nec sagittis leo. Suspendisse at felis egestas tellus ullamcorper fringilla vitae at lorem. Nulla consectetur, urna vitae euismod laoreet, lacus elit convallis nibh, mattis rhoncus ligula elit at erat. Cras sed justo blandit, tincidunt libero ac, vehicula arcu. In hac habitasse platea dictumst. Ut eu vestibulum risus. Nulla sodales tortor purus, eu faucibus lectus porta vitae. Suspendisse euismod nunc lectus. Etiam porta in nisi vitae pellentesque. Mauris blandit dolor eu libero malesuada mollis a nec enim. Praesent ullamcorper ultrices nibh nec auctor. Donec laoreet purus at erat aliquam, ut laoreet purus malesuada. Nulla sit amet mauris enim."
        donation2.date = Date()
        donation2.location = "Tangerang, ID"
        donation2.donationAmount = 3178500000
        
        let donation3 = Campaign()
        donation3.title = "Third item"
        donation3.description = "Integer efficitur consectetur dui, sed viverra risus pulvinar eget. Aliquam ullamcorper ullamcorper sem sit amet pulvinar. Praesent odio magna, pellentesque et fringilla non, hendrerit vitae sem. Vestibulum quis tortor at massa dapibus venenatis quis ut dui. Pellentesque eu massa commodo, scelerisque tellus vel, pellentesque orci."
        donation3.date = Date()
        donation3.location = "Kepulauan Seribu, ID"
        donation3.donationAmount = 2250499735.35
        
        let donation4 = Campaign()
        donation4.title = "Fourth item"
        donation4.description = "Morbi vitae bibendum massa."
        donation4.date = Date()
        donation4.location = "Pontianak, ID"
        donation4.donationAmount = 12575000
        
        donations.append(donation1)
        donations.append(donation2)
        donations.append(donation3)
        donations.append(donation4)
    }
}

// MARK: -
extension DonationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = donationTableView.dequeueReusableCell(withIdentifier: DonationTableViewCell.cellDescription, for: indexPath) as! DonationTableViewCell
        let donation = donations[indexPath.row]
        
        cell.titleLabel.text = donation.title
        cell.descriptionLabel.text = donation.description
        cell.locationLabel.text = donation.location
        cell.coralImageView.image = donation.image
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        cell.dateLabel.text = dateFormatter.string(from: donation.date)
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id-ID")
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        cell.donationAmountLabel.text = currencyFormatter.string(from: NSNumber(value: donation.donationAmount))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = DetailViewController()
        nextVC.selectedAction = donations[indexPath.row]
        nextVC.title = donations[indexPath.row].title
        navigationController?.pushViewController(nextVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

