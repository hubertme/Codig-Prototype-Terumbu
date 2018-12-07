//
//  Donation.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 05/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import Foundation
import UIKit

class Campaign{
    var title: String = ""
    var description: String = ""
    var location: String = ""
    var date: Date = Date()
    var image: UIImage = UIImage(named: "coral-test") ?? UIImage()
    var donationAmount: Double = 0
    
    var reports: Array<Report> = []
    var campaignPIC: String = ""
}
