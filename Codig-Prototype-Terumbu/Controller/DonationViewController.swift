//
//  ViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class DonationViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var donationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }

    // MARK: Private methods
    private func setupNavigationBar(){
        navigationController?.navigationBar.topItem?.title = "Donasiku"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension DonationViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

