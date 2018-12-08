//
//  NewsViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 07/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // MARK: - Outlets
    @IBOutlet weak var newsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Back"
        newsTableView.register(NewsCell.nib, forCellReuseIdentifier: NewsCell.cellDescription)
        
        newsTableView.tableFooterView = UIView()
        newsTableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsView = newsTableView.dequeueReusableCell(withIdentifier: NewsCell.cellDescription, for: indexPath) as! NewsCell
        newsView.selectionStyle = .none
        
        // Dummy data
        newsView.titleLabel.text = "Coral Reef Damage in Indonesia Reaches 46 Percent"
        newsView.newsLabel.text = """
        NETRALNEWS.COM - Fish Quarantine Agency for Quality Control and Fishery Products Safety (BKIPM) reports that coral reef damage rate in Indonesia has reached 46 percent of the total area nationally. "Nationwide level of damage has reached 46 percent and the figure is not much different from that in South Sulawesi waters," said Head of KIPM Makassar Sitti Chadijah in Makassar, Monday (08/28/2017). She said based on data, the number of marine conservation areas in South Sulawesi reached 16 million hectares, of which there is also one marine park area, a tourist park and four conservation areas. Sitti said, the high number of fish bombing or using compressor in the search for fish through illegal means, also known as illegal fishing, also affects all marine biota. Because according to her, this very high level of coral damage will inevitably inhibit the population of all marine animals including those protected by law.
        
        "If our society is not conscious-aware of the importance of this reef, it will certainly threaten our natural resources in the future, and our children will not enjoy it if it continues to be destroyed," he said. In order to be able to recover damaged coral reefs, it takes a very long time because one centimeter of coral reefs only grow in three years. "In those three years, it only grows one centimeter, so how long do we need to restore it if we start now, but it must be remembered that this must be done by all parties, the vision should be equal," he explained. Previously, South Sulawesi Police and the Ministry of Marine Affairs and Fisheries (KKP) through the Fish Quarantine Agency for Quality Control and Fishery Product Security (BKIPM) managed to uncover the smuggling of coral reefs (corals) abroad. "So initially, the delivery of coral from Sultan Hasanuddin Airport Makassar to Bali was a success and it is precisely that at the airport there is reported Bali smuggling," said South Sulawesi Police Chief Inspector General Pol Muktiono some time ago. Accompanied by the Head of the Fish Quarantine Agency, Quality Control and Fishery Products Safety (BKIPM) Rina, explains if the smuggling is in violation of other laws and government regulations. Muktiono admits that all coral reefs or corals, both living and dead, are bundled in a container and put in large suitcases. The coral is based on its route, going through the province of Bali and then to Lombok before abroad such as China, Singapore and others who order all these corals. "This is a syndicate, in Bali has been awaited then cross to Lombok and abroad.Overseas, there are already waiting for this all goods," he said.
        """
        newsView.newsImageView.image = UIImage(named: "news-image0")
        newsView.summaryLabel.text = "Take care of our lovely corals for the next generation"
        
        return newsView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
