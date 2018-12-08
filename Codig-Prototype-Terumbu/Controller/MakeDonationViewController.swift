//
//  MakeDonationViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 08/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class MakeDonationViewController: UIViewController {
    
//    var indexOfCampaign = 0
    
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
        if amountTextField.text! == ""{
            let alertController = UIAlertController(title: "Empty amount", message: "Please enter an amount", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Alright", style: .default, handler: nil)
            alertController.addAction(okayAction)
            self.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        let donatedAmount = Double(amountTextField.text!)!
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "id-ID")
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        
        let formattedAmountString = currencyFormatter.string(from: NSNumber(value: donatedAmount))!
        
        let alertController = UIAlertController(title: "Donation confirmation", message: "Are you sure you want to donate with an amount of \(formattedAmountString)?", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Yes", style: .default) { (_) in
            let insideAlert = UIAlertController(title: "Donation received", message: "Please wait for 1-2 working days for our staff checking your donation. Thank you for donating!", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "You're welcome", style: .default, handler: { (_) in
                self.handleDismissButton(self)
            })
            insideAlert.addAction(okayAction)
            self.present(insideAlert, animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "No", style: .cancel) { (_) in
            self.amountTextField.text = ""
        }
        
        alertController.addAction(okayAction)
        alertController.addAction(noAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func handleDismissButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
