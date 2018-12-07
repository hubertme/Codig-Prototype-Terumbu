//
//  NewsCell.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 07/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    // MARK: - Cell singletons
    static var cellDescription: String{
        return String(describing: self)
    }
    static var nib: UINib{
        return UINib(nibName: cellDescription, bundle: nil)
    }
    
    // MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.textColor = primaryColour
        summaryLabel.textColor = primaryColour
        newsLabel.textColor = .darkGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
