//
//  DetailCell.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit
import ChameleonFramework

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
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var picLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var latestReportLabel: UILabel!
    
    @IBOutlet weak var readMoreButton: UIButton!
    @IBOutlet weak var donateButton: UIButton!
    
    @IBOutlet var titlesLabel: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        donateButton.clipsToBounds = true
        donateButton.layer.cornerRadius = 10
        donateButton.backgroundColor = primaryColour
        readMoreButton.tintColor = primaryColour
        
        for titleLabel in titlesLabel{
            titleLabel.textColor = primaryColour
        }
    }
}
