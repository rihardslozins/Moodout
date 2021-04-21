//
//  SignUpViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 16/04/2021.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if passwordTextfield.text != repeatPasswordTextField.text {
            let alertController = UIAlertController(title: "Passwords Dont Match", message: "Please re-type password.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            if let email = emailTextField.text, let password = passwordTextfield.text {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    if error == nil {
                        
                        self.performSegue(withIdentifier: "SignUpToApp", sender: self)
                        
                    } else {
                        let alertController = UIAlertController(title: "Invalid Details", message: "Please provide correct Mail and password information.", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
    }
}
