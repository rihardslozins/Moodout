//
//  VideoViewController.swift
//  Moodout
//
//  Created by Rihards Lozins on 29/04/2021.
//

import UIKit
import Foundation
import Firebase
import AVKit

class VideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var videoStream = [Videos]()
    var ref: DatabaseReference!
    
    @IBOutlet weak var Table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference().child("videos")
        ref.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount > 0 {
                self.videoStream.removeAll()
                
                for video in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let CellObject = video.value as? [String: AnyObject]
                    let Title = CellObject?["Title"]
                    let videoLink = CellObject?["Link"]
                    let videoTime = CellObject?["Time"]
                    
                    let video = Videos(Title: (Title as! String), Link: (videoLink as! String), Time: (videoTime as! String))
                    
                    self.videoStream.append(video)
                    self.Table.reloadData()
                }
            }
            
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoStream.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath)
        
        let video = videoStream[indexPath.row]
        cell.textLabel?.text = video.Title
        cell.detailTextLabel?.text = video.Time
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let videoURL = URL(string: videoStream[indexPath.row].Link!) else {
            return
        }
        
        let player = AVPlayer(url: videoURL)
        let controller = AVPlayerViewController()
        controller.player = player
        
        present(controller, animated: true) {
            player.play()
        }
    }
}
