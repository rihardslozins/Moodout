//
//  VideoData.swift
//  Moodout
//
//  Created by Rihards Lozins on 29/04/2021.
//

import Foundation

class Videos {
    
    var Title: String?
    var Link: String?
    var Time: String?
    var VideoImage: String?
    
    init(Title: String?, Link: String?, Time: String?, VideoImage: String?) {
        self.Title = Title;
        self.Link = Link;
        self.Time = Time;
        self.VideoImage = VideoImage;
    }
}
