//
//  LoginViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 12/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
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
        
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (currentUser != nil){
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - TextField delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Actions
    @IBAction func handleLoginButtonTapped(){
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if (email == "") {
            createAlertWithOkayAction(title: "Empty email", message: "Please fill in your email")
        } else if (password == ""){
            createAlertWithOkayAction(title: "Empty password", message: "Please fill in your password")
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    print("Error:", error.localizedDescription)
                    
                    // Check connectivity issue
                    let networkErrorPredicate = NSPredicate(format: "SELF CONTAINS[cd] %@", "network error")
                    if (networkErrorPredicate.evaluate(with: error.localizedDescription)){
                        self.createAlertWithOkayAction(title: "Connectivity issue", message: "Please connect to an active internet connection to proceed")
                    } else {
                        self.createAlertWithOkayAction(title: "Failed to sign in", message: "Error signing in with the entered credential")
                    }
                    return
                }
                currentUser = Auth.auth().currentUser
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func handleDismissButtonTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func navigateToRegisterPage(){
        let registerVC = RegisterViewController()
//        self.dismiss(animated: true, completion: nil)
        self.present(registerVC, animated: true, completion: nil)
    }
    
    // MARK: - Private methods
    private func createAlertWithOkayAction(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
