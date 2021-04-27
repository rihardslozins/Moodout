//
//  Music.swift
//  Moodout
//
//  Created by Rihards Lozins on 27/04/2021.
//

import Foundation

struct Music {
    
    let songName: String
    let artistName: String
    let imageName: String
    let fileName: String
    
    static func createMusic() -> [Music] {
        var musics: [Music] = []
        
        let songsName = MusicData.shared.songName
        let artistsNames = MusicData.shared.artistName
        let imagesNames = MusicData.shared.imageName
        let filesNames = MusicData.shared.fileName
        
        for index in 0..<artistsNames.count {
            let music = Music(songName: songsName[index], artistName: artistsNames[index], imageName: imagesNames[index], fileName: filesNames[index])
            musics.append(music)
        }
        return musics
    }
}
