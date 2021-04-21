//
//  SignInViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 16/04/2021.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signInButton(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if error == nil {
                    self.performSegue(withIdentifier: "SignInToApp", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Wrong Credentials", message: "Invalid username or password", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
