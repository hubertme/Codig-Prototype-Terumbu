//
//  MakeDonationViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 08/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class MakeDonationViewController: UIViewController {
    
    var indexOfCampaign = 0
    
    // MARK: - Outlets
    @IBOutlet var headingLabels: [UILabel]!
    @IBOutlet weak var amountTextField: UITextField!
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeHeadingsColour()
    }
    
    // MARK: - Private methods
    private func changeHeadingsColour(){
        for heading in headingLabels{
            heading.textColor = primaryColour
        }
    }
    
    // MARK: - Actions
    @IBAction func handleAddDonation(_ sender: Any) {
        
    }
    
}
