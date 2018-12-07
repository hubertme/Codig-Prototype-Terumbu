//
//  NewsViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 07/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var newsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
