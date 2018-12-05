//
//  DonationTableViewCell.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class DonationTableViewCell: UITableViewCell {
    
    // MARK: - Cell singletons
    static var cellDescription: String{
        return String(describing: self)
    }
    static var nib: UINib{
        return UINib(nibName: cellDescription, bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var coralImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        coralImageView.clipsToBounds = true
        coralImageView.layer.cornerRadius = 5
    }
}
