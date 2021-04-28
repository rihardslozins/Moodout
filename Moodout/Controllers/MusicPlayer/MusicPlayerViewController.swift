//
//  MusicPlayerViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 28/04/2021.
//

import UIKit
import AVFoundation

class MusicPlayerViewController: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song] = []
    var player: AVAudioPlayer?
    
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumImageLabel: UIImageView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    func configure() {
        let song = songs[position]
        
        playPauseButton.setBackgroundImage(UIImage(named: "Pause"), for: .normal)
        
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            player.play()
            
        } catch {
            print("Error occurred")
            
        }
        
        trackNameLabel.text = song.name
        artistNameLabel.text = song.artistName
        albumImageLabel.image = UIImage(named: song.imageName)
        
        
    } // End configure func
    
    
    @IBAction func closeViewButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playPauseButton(_ sender: Any) {
        if(player?.isPlaying==true) {
            
            // Pause
            player?.pause()
            
            // Show play button
            playPauseButton.setBackgroundImage(UIImage(named: "Play"), for: .normal)
            
        } else {
            
            // Play
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(named: "Pause"), for: .normal)
            
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        if(position<(songs.count-1)) {
            position = position + 1
            player?.stop()
            configure()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        if(position>0) {
            position = position - 1
            player?.stop()
            configure()
        }
    }
}
