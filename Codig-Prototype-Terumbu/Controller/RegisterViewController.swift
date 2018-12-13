//
//  RegisterViewController.swift
//  Codig-Prototype-Terumbu
//
//  Created by Hubert Wang on 13/12/18.
//  Copyright © 2018 Hubert Wang. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButton.clipsToBounds = true
        signUpButton.layer.cornerRadius = 10.0
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        retypePasswordTextField.delegate = self
    }
    
    // MARK: - Delegates
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Private Methods
    private func isValidEmail(_ sender: String) -> Bool{
        let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&‘*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}" +
            "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" +
            "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-" +
            "z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5" +
            "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" +
            "9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" +
        "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        return emailTest.evaluate(with: sender)
    }
    
    private func isValidPassword(_ sender: String) -> Bool{
        return sender.count >= 6 ? true : false
    }
    
    private func createAlertWithOkayAction(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func dismissRegisterPage(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleUserSignUp(_ sender: UIButton){
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if !(isValidEmail(email)){
            createAlertWithOkayAction(title: "Invalid email", message: "Please enter a valid email format")
        } else if !(isValidPassword(password)){
            createAlertWithOkayAction(title: "Invalid password", message: "Please enter password with minimum 6 characters")
        } else if (password != retypePasswordTextField.text!){
            createAlertWithOkayAction(title: "Password mismatch", message: "Please retype your password")
        } else {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    print("Error:", error.localizedDescription)
                    
                    // Predicate
                    let emailInUsePrediacate = NSPredicate(format: "SELF CONTAINS[cd] %@", "already in use")
                    let networkErrorPredicate = NSPredicate(format: "SELF CONTAINS[cd] %@", "network error")
                    if emailInUsePrediacate.evaluate(with: error.localizedDescription) {
                        self.createAlertWithOkayAction(title: "User exist", message: "User email is exist, please use another email")
                    } else if networkErrorPredicate.evaluate(with: error.localizedDescription){
                        self.createAlertWithOkayAction(title: "Connectivity issue", message: "Please connect to an active internet connection to proceed")
                    } else {
                        self.createAlertWithOkayAction(title: "Failed to sign up", message: "Please try again")
                    }
                    
                    return
                }
                currentUser = result?.user
                
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
