//
//  MainMusicViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 28/04/2021.
//

import Foundation
import UIKit

class MainMusicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var table: UITableView?
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table?.delegate = self
        table?.dataSource = self
        
        configureSongs()
        
    }
    
    func configureSongs() {
        songs.append(Song(name: "Blapradur",
                          albumName: "Kveikur",
                          artistName: "Sigur Rós",
                          imageName: "sigur_image",
                          trackName: "Blapradur"))
        songs.append(Song(name: "Colors In Space",
                          albumName: "The Wilderness",
                          artistName: "Explosions In The Sky",
                          imageName: "explosions_image",
                          trackName: "Colors_In_Space"))
        songs.append(Song(name: "Dry Fantasy",
                          albumName: "As the Love Continues",
                          artistName: "Mogwai",
                          imageName: "mogwai_image",
                          trackName: "Dry_Fantasy"))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
        
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artistName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true )
        
        
        // Present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "MusicPlayer") as? MusicPlayerViewController else {
            return
            
        }
        vc.songs = self.songs
        vc.position = position
        present(vc, animated: true)
        
    }
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
    
}
