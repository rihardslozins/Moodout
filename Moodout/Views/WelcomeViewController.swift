//
//  WelcomeViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 15/04/2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

}
