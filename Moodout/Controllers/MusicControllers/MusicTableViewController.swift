//
//  MusicTableViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 27/04/2021.
//

import UIKit

class MusicTableViewController: UITableViewController {
    
    var musics = Music.createMusic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clearsSelectionOnViewWillAppear = true
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return musics.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicTableViewCell", for: indexPath)
        
        let music = musics[indexPath.row]
        cell.textLabel?.text = music.songName
        cell.detailTextLabel?.text = music.artistName
        cell.imageView?.image = UIImage(named: music.imageName)
        
        return cell
        
    }
    
    // MARK: - Table view Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            let detailVC = segue.destination as! MusicDetailViewController
            // Pass the selected object to the new view controller.
            
            detailVC.musicPlayer = musics[indexPath.row]
            
        }
    }
}
