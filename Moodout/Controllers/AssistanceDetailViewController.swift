//
//  AssistanceDetailViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 21/04/2021.
//

import UIKit

class AssistanceDetailViewController: UIViewController {
    
    var assistancePlace: AssistancePlace!
    
    @IBOutlet weak var centreImageView: UIImageView!
    @IBOutlet weak var centreNameLabel: UILabel!
    @IBOutlet weak var centrePhoneLabel: UILabel!
    @IBOutlet weak var centreHoursLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if assistancePlace != nil {
            
            centreImageView.image = UIImage(named: assistancePlace.centreImage)
            centreNameLabel.text = assistancePlace.centreName
            centrePhoneLabel.text = assistancePlace.centreNumber
            centreHoursLabel.text = assistancePlace.centreHours
            
        }
    }
}
