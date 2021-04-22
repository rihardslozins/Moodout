//
//  HomeViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 20/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateStyle = .medium
        
        dateLabel.text = formatter.string(from: date)
        
    }
}
