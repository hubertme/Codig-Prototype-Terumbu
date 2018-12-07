//
//  NewsCardCell.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 07/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class NewsCardCell: UICollectionViewCell {
    
    static var cellDescription: String{
        return String(describing: self)
    }
    static var nib: UINib{
        return UINib(nibName: cellDescription, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 15
    }

}
