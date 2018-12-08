//
//  CampaignCardCell.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 08/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class CampaignCardCell: UICollectionViewCell {
    
    // MARK: - Singletons
    static var cellDescription: String{
        return String(describing: self)
    }
    static var nib: UINib{
        return UINib(nibName: cellDescription, bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var organisationLabel: UILabel!
    @IBOutlet weak var donationLabel: UILabel!
    @IBOutlet weak var campaignImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
    }

}
