//
//  LocationCardCell.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 07/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class LocationCardCell: UICollectionViewCell {
    
    static var cellDescription: String{
        return String(describing: self)
    }
    static var nib: UINib{
        return UINib(nibName: cellDescription, bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
    }

}
