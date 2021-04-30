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
        songs.append(Song(name: "Alive",
                          artistName: "ROAM",
                          imageName: "roam_cover",
                          trackName: "ROAM_Alive"))
        songs.append(Song(name: "Coffee Talk",
                          artistName: "Broadside",
                          imageName: "broadside_cover",
                          trackName: "Broadside_Coffee_Talk"))
        songs.append(Song(name: "Up & Go",
                          artistName: "The Starting Line",
                          imageName: "starting_line_cover",
                          trackName: "The_Starting_Line_Up_Go"))
        
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
        
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artistName
        cell.imageView?.image = UIImage(named: song.imageName)
        
        return cell
        
    }
    
    // MARK: - Table view Delegate
    
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

// Struct for Song

struct Song {
    let name: String
    let artistName: String
    let imageName: String
    let trackName: String
    
}
