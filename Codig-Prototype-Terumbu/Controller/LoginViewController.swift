//
//  LoginViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 12/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet var headingLabels: [UILabel]!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 10
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - TextField delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Actions
    @IBAction func handleLoginButtonTapped(){
        
    }
    
    @IBAction func handleDismissButtonTapped(){
        
    }
}
