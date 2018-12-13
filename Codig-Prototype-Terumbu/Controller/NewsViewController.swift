//
//  NewsViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 07/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    var selectedNews = News()
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // MARK: - Outlets
    @IBOutlet weak var newsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.topItem?.title = "Back"
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
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        
        newsView.titleLabel.text = selectedNews.title
        newsView.newsLabel.text = selectedNews.content
        newsView.dateLabel.text = dateFormatter.string(from: selectedNews.date)
        newsView.newsImageView.image = selectedNews.newsImage
        newsView.summaryLabel.text = selectedNews.summary
        
        return newsView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
