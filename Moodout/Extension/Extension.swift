//
//  Extension.swift
//  Moodout
//
//  Created by Rihards Lozins on 15/04/2021.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius : CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
