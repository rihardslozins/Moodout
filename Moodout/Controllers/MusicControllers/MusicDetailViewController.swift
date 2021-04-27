//
//  MusicDetailViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 27/04/2021.
//

import UIKit
import AVFoundation

class MusicDetailViewController: UIViewController {
    
    var musicPlayer: Music!
    var player: AVAudioPlayer?
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumCoverIamge: UIImageView!
    @IBOutlet weak var buttonPlayPause: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonPrevious: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if musicPlayer != nil {
            songNameLabel.text = musicPlayer.songName
            artistNameLabel.text = musicPlayer.artistName
            albumCoverIamge.image = UIImage(named: musicPlayer.imageName)
            
            playSong()
        }
    }
    
    func playSong() {
        
        buttonPlayPause.setBackgroundImage(UIImage(named: "Pause"), for: .normal)
        
        guard let urlSong = Bundle.main.url(forResource: musicPlayer.fileName, withExtension: "mp3") else { return }
        
        do {
            
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            
            player = try AVAudioPlayer(contentsOf: urlSong, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else {
                return
            }
            
            player.play()
        }
        catch {
            print("error")
        }
    }
    
    @IBAction func didTapButon(_ sender: Any) {
        if player?.isPlaying == true {
            // pause
            player?.pause()
            buttonPlayPause.setBackgroundImage(UIImage(named: "Play"), for: .normal)
        }
        else {
            // play
            player?.play()
            buttonPlayPause.setBackgroundImage(UIImage(named: "Pause"), for: .normal)
        }
    }
}
