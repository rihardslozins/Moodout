//
//  AssistancePlace.swift
//  Moodout
//
//  Created by Rihards Lozins on 21/04/2021.
//

import Foundation

struct AssistancePlace {
    
    let centreName: String
    let centreImage: String
    let centreHours: String
    let centreNumber: String
    
    static func createAssistance() -> [AssistancePlace] {
        var centres: [AssistancePlace] = []
        
        let centresNames = AssistanceData.shared.centreName
        let centresImages = AssistanceData.shared.centreImage
        let centresHours = AssistanceData.shared.centreHours
        let centresNumbers = AssistanceData.shared.centreNumber
        
        for index in 0..<centresNames.count {
            let centre = AssistancePlace(centreName: centresNames[index], centreImage: centresImages[index], centreHours: centresHours[index], centreNumber: centresNumbers[index])
            centres.append(centre)
        }
        return centres  
    }
    
}
