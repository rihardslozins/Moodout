//
//  MoodMenuViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 16/04/2021.
//

import UIKit
import Firebase

class MoodMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}
