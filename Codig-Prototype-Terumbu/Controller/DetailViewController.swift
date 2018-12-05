//
//  DetailViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedAction = CoralAction()
    
    // MARK: - Outlets
    @IBOutlet weak var pageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageTableView.tableFooterView = UIView()
    }
    
    // MARK: Private methods
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
