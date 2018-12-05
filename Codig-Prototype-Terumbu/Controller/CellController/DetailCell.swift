//
//  DetailCell.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    
    // MARK: - Singletons
    static var cellDescription: String{
        return String(describing: self)
    }
    static var nib: UINib{
        return UINib(nibName: cellDescription, bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var coralImageView: UIImageView!
    @IBOutlet weak var donationAmountLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var donateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        donateButton.clipsToBounds = true
        donateButton.layer.cornerRadius = 10
    }
}
